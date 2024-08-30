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
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/users")
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
    @GetMapping("/all")
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> users = userService.getAllUsers();
        return new ResponseEntity<>(users, HttpStatus.OK);
    }
    @PutMapping("/update/{id}")
    public ResponseEntity<User> updateUser(@PathVariable Long id, @RequestBody User userDetails) {
        User updatedUser = userService.updateUser(id, userDetails);
        return new ResponseEntity<>(updatedUser, HttpStatus.OK);
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return new ResponseEntity<>("User deleted successfully", HttpStatus.OK);
    }
}
