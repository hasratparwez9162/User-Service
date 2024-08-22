package com.bank.user_service.service;

import com.bank.user_service.dto.Account;
import com.bank.user_service.entity.User;

public interface UserService {
    User openAccount(User user);
}
