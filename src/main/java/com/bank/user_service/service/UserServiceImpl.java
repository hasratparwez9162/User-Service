package com.bank.user_service.service;

import com.bank.user_service.dto.Account;
import com.bank.user_service.entity.User;
import com.bank.user_service.external.service.AccountService;
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
//       user.setAccounts(accountService.getAccountById(id).getBody());
       return user;
    }

}
