package com.bank.user_service.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.ArrayList;
import java.util.List;

@ControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /**
     * Handles UserNotFoundException.
     * @param ex The exception.
     * @return A response entity with the error message and HTTP status.
     */
    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<String> handleUserNotFoundException(UserNotFoundException ex) {
        logger.error("User not found: {}", ex.getMessage());
        return new ResponseEntity<>("User Not Found", HttpStatus.NOT_FOUND);
    }

    /**
     * Handles DataIntegrityViolationException.
     * @param ex The exception.
     * @return A response entity with the error message and HTTP status.
     */
    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<String> dataIntegrityViolationException(DataIntegrityViolationException ex) {
        String message = ex.getMessage();
        logger.error("Data integrity violation: {}", message);
        return new ResponseEntity<>(message, HttpStatus.IM_USED);
    }

    /**
     * Handles ApplicationNotFoundException.
     * @param ex The exception.
     * @return A response entity with the error message and HTTP status.
     */
    @ExceptionHandler(ApplicationNotFoundException.class)
    public ResponseEntity<String> handleApplicationNotFoundException(ApplicationNotFoundException ex) {
        logger.error("Application not found: {}", ex.getMessage());
        return new ResponseEntity<>(ex.getMessage(), HttpStatus.NOT_FOUND);
    }

    /**
     * Handles OpenAccountException.
     * @param ex The exception.
     * @return A response entity with the error message and HTTP status.
     */
    @ExceptionHandler(OpenAccountException.class)
    public ResponseEntity<String> handleOpenAccountException(OpenAccountException ex) {
        logger.error("Error opening account: {}", ex.getMessage());
        return new ResponseEntity<>(ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    /**
     * Extracts a user-friendly message from a DataIntegrityViolationException message.
     * @param message The original exception message.
     * @return A user-friendly error message.
     */
    public String getMessage(String message) {
        // Define a regular expression to match the duplicate entry message
        String regex = "Duplicate entry '([^']*)' for key";
        // Compile the regular expression
        java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(regex);
        // Create a matcher from the pattern and input string
        java.util.regex.Matcher matcher = pattern.matcher(message);

        // Check if the pattern matches
        if (matcher.find()) {
            // Return the duplicate entry message
            return "User with : " + matcher.group(1) + " already exist";
        } else {
            // Return a message if no duplicate entry is found
            return "No duplicate entry found in the error message.";
        }
    }
}