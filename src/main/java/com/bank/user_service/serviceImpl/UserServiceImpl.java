package com.bank.user_service.serviceImpl;

import com.bank.user_service.dto.Account;
import com.bank.user_service.entity.User;
import com.bank.user_service.exception.UserNotFoundException;
import com.bank.user_service.external.service.AccountService;
import com.bank.user_service.external.service.CardService;
import com.bank.user_service.external.service.LoanService;
import com.bank.user_service.repository.UserRepository;
import com.bank.user_service.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;


import java.util.Collections;
import java.util.List;

@org.springframework.stereotype.Service
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AccountService accountService;

    @Autowired
    private LoanService loanService;

    @Autowired
    private CardService cardService;

    @Override
    @Transactional
    public User openAccount(User user) {
        try {
            User newUser = userRepository.save(user);
            Account account = Account.builder()
                    .userId(newUser.getId())
                    .accountType(user.getAccountType())
                    .userName(newUser.getFirstName() + " " + newUser.getLastName())
                    .email(newUser.getEmail())
                    .phoneNumber(newUser.getPhoneNumber())
                    .build();
            Account newAccount = accountService.addAccount(account);
            newUser.setAccounts(Collections.singletonList(newAccount));
            return newUser;
        } catch (Exception e) {
            logger.error("Error opening account: {}", e.getMessage());
            throw new RuntimeException("Failed to open account: " + e.getMessage());
        }
    }
    @Override
    public User getUserByID(Long id) {
        try {
            User user = userRepository.findById(id).orElseThrow(() -> new UserNotFoundException());
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
        } catch (Exception e) {
            logger.error("Error fetching user by email: {}", e.getMessage());
            throw e;
        }
    }

    @Override
    public List<User> getAllUsers() {
        try {
            return userRepository.findAll();
        } catch (Exception e) {
            logger.error("Error fetching all users: {}", e.getMessage());
            throw e;
        }
    }

    @Override
    public User getUserByEmail(String email) {
        try {
            User user = userRepository.findByEmail(email);
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
        } catch (Exception e) {
            logger.error("Error fetching user by email: {}", e.getMessage());
            throw e;
        }
    }

    @Override
    public User updateUser(Long id, User userDetails) {
        try {
            User existingUser = userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found"));

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
        } catch (Exception e) {
            logger.error("Error updating user: {}", e.getMessage());
            throw e;
        }
    }

    @Override
    public void deleteUser(Long id) {
        try {
            User existingUser = userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found"));
            userRepository.delete(existingUser);
        } catch (Exception e) {
            logger.error("Error deleting user: {}", e.getMessage());
            throw e;
        }
    }
    @Override
    public User getUserByAccountNumber(String accountNumber) {
        try {
            Account account;
            try {
                account = accountService.getAccountByAccountNumber(accountNumber);
            } catch (Exception e) {
                logger.error("Error fetching account: {}", e.getMessage());
                throw new RuntimeException("Failed to fetch account by account number: " + e.getMessage());
            }

            User user = userRepository.findById(account.getUserId()).orElseThrow(() -> new UserNotFoundException());
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
        } catch (Exception e) {
            logger.error("Error fetching user by account number: {}", e.getMessage());
            throw new RuntimeException("Failed to fetch user by account number: " + e.getMessage());
        }
    }
}