package com.bank.user_service.dto;

import lombok.Data;

@Data
public class UserRequest {
    private String firstName;
    private String lastName;
    private String gender;
    private String address;
    private String state;
    private String email;
    private String phoneNumber;
    private String alternatePhoneNumber;
    private String isActive;
}
