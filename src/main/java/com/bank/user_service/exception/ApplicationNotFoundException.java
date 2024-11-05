package com.bank.user_service.exception;

/**
 * Exception thrown when an application is not found.
 */
public class ApplicationNotFoundException extends RuntimeException {
    public ApplicationNotFoundException(String message) {
        super(message);
    }
}
