package com.bank.user_service.service.serviceImpl;

import com.bank.core.entity.IsUserActive;
import com.bank.user_service.dto.Account;
import com.bank.user_service.dto.UpdateUserStatusRequest;
import com.bank.user_service.entity.User;
import com.bank.user_service.exception.AccountNotFoundException;
import com.bank.user_service.exception.ApplicationNotFoundException;
import com.bank.user_service.exception.OpenAccountException;
import com.bank.user_service.exception.UserNotFoundException;
import com.bank.user_service.external.service.AccountService;
import com.bank.user_service.external.service.CardService;
import com.bank.user_service.external.service.LoanService;
import com.bank.user_service.repository.UserRepository;
import com.bank.user_service.service.UserService;
import jakarta.transaction.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import java.util.Collections;
import java.util.List;
import java.util.Random;

@org.springframework.stereotype.Service
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    private final UserRepository userRepository;
    private final AccountService accountService;
    private final LoanService loanService;
    private final CardService cardService;
    private final UserEventProducer userEventProducer;

    public UserServiceImpl(UserRepository userRepository, AccountService accountService, LoanService loanService, CardService cardService, UserEventProducer userEventProducer) {
        this.userRepository = userRepository;
        this.accountService = accountService;
        this.loanService = loanService;
        this.cardService = cardService;
        this.userEventProducer = userEventProducer;
    }

    /**
     * Opens a new account for the user.
     * @param user The user entity.
     * @return The saved user entity.
     */
    @Transactional
    public User openAccount(User user) {
        try {
            boolean saved = false;
            while (!saved) {
                try {
                    user.setApplicationId(generateUniqueApplicationId());
                    user.setIsActive(IsUserActive.INACTIVE);
                    User newUser = userRepository.save(user);
                    userEventProducer.sendUserCreatedMessage(newUser);
                    saved = true;
                } catch (DataIntegrityViolationException e) {
                    logger.error("Duplicate applicationId, regenerating: {}", e.getMessage());
                }
            }
            return user;
        } catch (Exception e) {
            logger.error("Unexpected error: {}", e.getMessage());
            throw new OpenAccountException("An unexpected error occurred while opening the account: " + e.getMessage());
        }
    }

    /**
     * Retrieves a user by application ID.
     * @param applicationId The application ID.
     * @return The user entity.
     */
    @Override
    public User getUserByApplicationId(String applicationId) {
        return userRepository.findByApplicationId(applicationId)
                .orElseThrow(() -> new ApplicationNotFoundException("Application not found with ID: " + applicationId));
    }

    /**
     * Updates the status of a user.
     * @param request The update request.
     * @return The updated user entity.
     */
    @Override
    @Transactional
    public User updateUserStatus(UpdateUserStatusRequest request) {
        User user = userRepository.findByApplicationId(request.getApplicationId())
                .orElseThrow(() -> new UserNotFoundException("User not found with application ID: " + request.getApplicationId()));

        user.setComments(request.getComment());
        user.setIsActive(request.getIsActive());
        userRepository.save(user);
        userEventProducer.sendUserUpdatedMessage(user);

        if (request.getIsActive().equals(IsUserActive.ACTIVE)) {
            try {
                accountService.addAccount(Account.builder()
                        .userId(user.getId())
                        .accountType(user.getAccountType())
                        .userName(user.getFirstName() + " " + user.getLastName())
                        .email(user.getEmail())
                        .phoneNumber(user.getPhoneNumber())
                        .build());
            } catch (Exception e) {
                logger.error("Error adding account: {}", e.getMessage());
                throw new OpenAccountException("Failed to open account: " + e.getMessage());
            }
        }
        return user;
    }

    /**
     * Retrieves a list of inactive and rejected users.
     * @return The list of users.
     */
    @Override
    public List<User> getInactiveAndRejectedUsers() {
        return userRepository.findInactiveAndRejectedUsers();
    }

    /**
     * Retrieves a user by ID.
     * @param id The user ID.
     * @return The user entity.
     */
    @Override
    public User getUserByID(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException("User not found with ID: " + id));
        try {
            user.setAccounts(accountService.getAccountById(user.getId()));
        } catch (Exception e) {
            user.setAccounts(Collections.emptyList());
            logger.error("Error fetching accounts: {}", e.getMessage());
        }
        try {
            user.setLoans(loanService.getLoansByUserId(user.getId()));
        } catch (Exception e) {
            user.setLoans(Collections.emptyList());
            logger.error("Error fetching loans: {}", e.getMessage());
        }
        try {
            user.setCards(cardService.getCardsByUserId(user.getId()));
        } catch (Exception e) {
            user.setCards(Collections.emptyList());
            logger.error("Error fetching cards: {}", e.getMessage());
        }
        return user;
    }

    /**
     * Retrieves all users.
     * @return The list of users.
     */
    @Override
    public List<User> getAllUsers() {
        try {
            return userRepository.findAll();
        } catch (Exception e) {
            logger.error("Error fetching all users: {}", e.getMessage());
            throw new RuntimeException("Failed to fetch all users: " + e.getMessage());
        }
    }

    /**
     * Retrieves a user by email.
     * @param email The email address.
     * @return The user entity.
     */
@Override
public User getUserByEmail(String email) {
    User user = userRepository.findByEmail(email);
    if (user == null) {
        throw new UserNotFoundException("User not found with email: " + email);
    }
    try {
        user.setAccounts(accountService.getAccountById(user.getId()));
    } catch (Exception e) {
        user.setAccounts(Collections.emptyList());
        logger.error("Error fetching accounts: {}", e.getMessage());
    }
    try {
        user.setLoans(loanService.getLoansByUserId(user.getId()));
    } catch (Exception e) {
        user.setLoans(Collections.emptyList());
        logger.error("Error fetching loans: {}", e.getMessage());
    }
    try {
        user.setCards(cardService.getCardsByUserId(user.getId()));
    } catch (Exception e) {
        user.setCards(Collections.emptyList());
        logger.error("Error fetching cards: {}", e.getMessage());
    }
    return user;
}

    /**
     * Updates a user.
     * @param id The user ID.
     * @param userDetails The user details to update.
     * @return The updated user entity.
     */
    @Override
    public User updateUser(Long id, User userDetails) {
        User existingUser = userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException("User not found with ID: " + id));

        if (userDetails.getFirstName() != null) {
            existingUser.setFirstName(userDetails.getFirstName());
        }
        if (userDetails.getLastName() != null) {
            existingUser.setLastName(userDetails.getLastName());
        }
        if (userDetails.getEmail() != null) {
            existingUser.setEmail(userDetails.getEmail());
        }
        if (userDetails.getPhoneNumber() != null) {
            existingUser.setPhoneNumber(userDetails.getPhoneNumber());
        }
        if (userDetails.getAlternatePhoneNumber() != null) {
            existingUser.setAlternatePhoneNumber(userDetails.getAlternatePhoneNumber());
        }
        if (userDetails.getAddress() != null) {
            existingUser.setAddress(userDetails.getAddress());
        }
        if (userDetails.getState() != null) {
            existingUser.setState(userDetails.getState());
        }
        if (userDetails.getPicturePath() != null) {
            existingUser.setPicturePath(userDetails.getPicturePath());
        }
        if (userDetails.getIdProofPath() != null) {
            existingUser.setIdProofPath(userDetails.getIdProofPath());
        }

        return userRepository.save(existingUser);
    }

    /**
     * Deletes a user by ID.
     * @param id The user ID.
     */
    @Override
    public void deleteUser(Long id) {
        User existingUser = userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException("User not found with ID: " + id));
        userRepository.delete(existingUser);
    }

    /**
     * Retrieves a user by account number.
     * @param accountNumber The account number.
     * @return The user entity.
     */
    @Override
    public User getUserByAccountNumber(String accountNumber) {
        Account account;
        try {
            account = accountService.getAccountByAccountNumber(accountNumber);
        } catch (Exception e) {
            logger.error("Error fetching account: {}", e.getMessage());
            throw new AccountNotFoundException("Failed to fetch account by account number: " + e.getMessage());
        }

        User user = userRepository.findById(account.getUserId())
                .orElseThrow(() -> new UserNotFoundException("User not found with account number: " + accountNumber));
        user.setAccounts(Collections.singletonList(account));

        try {
            user.setLoans(loanService.getLoansByUserId(user.getId()));
        } catch (Exception e) {
            user.setLoans(Collections.emptyList());
            logger.error("Error fetching loans: {}", e.getMessage());
        }

        try {
            user.setCards(cardService.getCardsByUserId(user.getId()));
        } catch (Exception e) {
            user.setCards(Collections.emptyList());
            logger.error("Error fetching cards: {}", e.getMessage());
        }

        return user;
    }


    /**
     * Generates a unique application ID.
     * @return The unique application ID.
     */
    private String generateUniqueApplicationId() {
        String applicationId;
        do {
            applicationId = generateApplicationId();
        } while (userRepository.existsByApplicationId(applicationId));
        return applicationId;
    }

    /**
     * Generates an application ID.
     * @return The application ID.
     */
    private String generateApplicationId() {
        Random random = new Random();
        int randomNumber = 10000000 + random.nextInt(90000000); // Generate an 8-digit number
        return "HP" + randomNumber;
    }
}