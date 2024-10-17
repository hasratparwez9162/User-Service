package com.bank.user_service.controler;


import com.bank.user_service.entity.User;
import com.bank.user_service.external.service.AccountService;
import com.bank.user_service.serviceImpl.UserServiceImpl;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/users")
public class UserControler {

    @Autowired
    UserServiceImpl userService;

    @Autowired
    AccountService accountService;

    @PostMapping("/open-account")
    public ResponseEntity<?> openAccount(@RequestBody @Valid User user, BindingResult result){
        System.out.println("Start Creating Account");
        if (result.hasErrors()) {
            Map<String, String> errors = new HashMap<>();
            result.getFieldErrors().forEach(error -> {
                errors.put(error.getField(), error.getDefaultMessage());
            });
            return ResponseEntity.badRequest().body(errors);
        }
       User newUser = userService.openAccount(user);
       return  new ResponseEntity<>(newUser, HttpStatus.CREATED);
    }
    @GetMapping("/user/{id}")
    public ResponseEntity<User> getUserById (@PathVariable Long id){
        User user = userService.getUserByID(id);
        return new ResponseEntity<>(user,HttpStatus.FOUND);
    }
    @GetMapping("/{email}")
    public ResponseEntity<User> getUserByEmail (@PathVariable String email){
        User user = userService.getUserByEmail(email);
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
    @GetMapping("/account/{accountNumber}")
    public ResponseEntity<User> getUserByAccountNumber(@PathVariable String accountNumber) {
        User user = userService.getUserByAccountNumber(accountNumber);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }
}
