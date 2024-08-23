package com.bank.user_service.controler;

import com.bank.user_service.dto.Account;
import com.bank.user_service.entity.User;
import com.bank.user_service.external.service.AccountService;
import com.bank.user_service.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Optional;

@RestController
public class UserControler {

    @Autowired
    UserServiceImpl userService;

    @Autowired
    AccountService accountService;

    @PostMapping("/open-account")
    public ResponseEntity<User> openAccount(@RequestBody User user){
       User newUser = userService.openAccount(user);
       return  new ResponseEntity<>(newUser, HttpStatus.CREATED);
    }
    @GetMapping("/user/{id}")
    public ResponseEntity<User> getUserById (@PathVariable Long id){
        User user = userService.getUserByID(id);
        return new ResponseEntity<>(user,HttpStatus.FOUND);
    }
}
