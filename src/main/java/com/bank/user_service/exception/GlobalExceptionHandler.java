package com.bank.user_service.exception;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


import java.util.ArrayList;
import java.util.List;


@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<String> handleUserNotFoundException(UserNotFoundException ex) {
        return new ResponseEntity<>("User Not Found", HttpStatus.NOT_FOUND);
    }
    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<String> dataIntegrityViolationException(DataIntegrityViolationException ex){
        return new ResponseEntity<>(getMessage(ex.getMessage()),HttpStatus.IM_USED);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<String> handleGenericException(Exception ex) {
       ArrayList st = new ArrayList(List.of(ex.getStackTrace())) ;
        return new ResponseEntity<>("An error occurred: " + ex.getMessage()+ "\n"+ st +"\n" + ex.getClass(), HttpStatus.INTERNAL_SERVER_ERROR);
    }
    public String getMessage(String message){
        // Define a regular expression to match the duplicate entry message
        String regex = "Duplicate entry '([^']*)' for key";
        // Compile the regular expression
        java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(regex);
        // Create a matcher from the pattern and input string
        java.util.regex.Matcher matcher = pattern.matcher(message);

        // Check if the pattern matches
        if (matcher.find()) {
            // Return the duplicate entry message
            return "User with : " + matcher.group(1) +" already exist";
        } else {
            // Return a message if no duplicate entry is found
            return "No duplicate entry found in the error message.";
        }
    }
}

