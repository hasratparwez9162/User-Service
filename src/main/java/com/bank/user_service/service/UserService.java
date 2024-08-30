package com.bank.user_service.service;

import com.bank.user_service.dto.Account;
import com.bank.user_service.entity.User;

import java.util.List;

public interface UserService {
    User openAccount(User user);
    User getUserByID(Long id);
    User updateUser(Long id, User userDetails);
    void deleteUser(Long id);
    List<User> getAllUsers();

}
