package com.bank.user_service.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

import java.util.Locale;

@Component
public class ErrorMessages {

    @Autowired
    private MessageSource messageSource;

    public String getApplicationNotFoundMessage() {
        return messageSource.getMessage("application.not.found", null, Locale.getDefault());
    }

    public String getUserNotFoundMessage() {
        return messageSource.getMessage("user.not.found", null, Locale.getDefault());
    }

    public String getDuplicateEmailMessage() {
        return messageSource.getMessage("duplicate.email", null, Locale.getDefault());
    }

    public String getUnexpectedErrorMessage() {
        return messageSource.getMessage("unexpected.error", null, Locale.getDefault());
    }
}