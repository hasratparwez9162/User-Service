package com.bank.user_service.dto;

import com.bank.core.entity.IsUserActive;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateUserStatusRequest {
    private Long userId;
    private String applicationId;
    private String comment;
    private IsUserActive isActive;
}
