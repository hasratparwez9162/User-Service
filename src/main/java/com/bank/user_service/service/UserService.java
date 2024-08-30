package com.bank.user_service.service;

import com.bank.user_service.dto.Account;
import com.bank.user_service.entity.User;

public interface UserService {
    User openAccount(User user);
    User getUserByID(Long id);
    User updateUser(Long id, User userDetails);
    void deleteUser(Long id);

}
