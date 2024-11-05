package com.bank.user_service.exception;

/**
 * Exception thrown when there is an error opening an account.
 */
public class OpenAccountException extends RuntimeException {
    public OpenAccountException(String message) {
        super(message);
    }
}
