package com.bank.user_service.service;

import com.bank.user_service.dto.Account;
import com.bank.user_service.dto.Loan;
import com.bank.user_service.entity.User;
import com.bank.user_service.external.service.AccountService;
import com.bank.user_service.external.service.CardService;
import com.bank.user_service.external.service.LoanService;
import com.bank.user_service.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;
import java.util.List;

@org.springframework.stereotype.Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AccountService accountService;

    @Autowired
    private LoanService loanService;

    @Autowired
    private CardService cardService;
    @Override
    public User openAccount(User user) {
        User newUser = userRepository.save(user);
        // Create the account and pass necessary user details
        Account account = Account.builder()
                .userId(newUser.getId())            // User ID from user-service
                .userName(newUser.getFirstName() + " " + newUser.getLastName()) // User name
                .email(newUser.getEmail())          // User email
                .phoneNumber(newUser.getPhoneNumber()) // User phone number
                .build();
        // Communicate with account-service to create the account
        Account newAccount = accountService.addAccount(account);
        newUser.setAccounts(Collections.singletonList(newAccount));

      return   userRepository.save(newUser);
    }


    public User getUserByID(Long id){
        User user = userRepository.findById(id).orElse(null);
        user.setAccounts(accountService.getAccountById(user.getId()));
        user.setLoans(loanService.getLoansByUserId(id));
        user.setCards(cardService.getCardsByUserId(id));
       return user;
    }
    public User updateUser(Long id, User userDetails) {
        User existingUser = userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found"));
        existingUser.setFirstName(userDetails.getFirstName());
        existingUser.setLastName(userDetails.getLastName());
        existingUser.setEmail(userDetails.getEmail());
        existingUser.setPhoneNumber(userDetails.getPhoneNumber());
        // Update other fields as needed
        return userRepository.save(existingUser);
    }
    // Delete user by ID
    public void deleteUser(Long id) {
        User existingUser = userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found"));
        userRepository.delete(existingUser);
    }

}
