package com.bank.user_service.dto;


import com.bank.core.entity.IsUserActive;
import lombok.Data;


@Data
public class UserStatus {
    private IsUserActive IsActive;
    private String comments;



}
