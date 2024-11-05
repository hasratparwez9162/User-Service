package com.bank.user_service.controler;

import com.bank.user_service.config.ErrorMessages;
import com.bank.user_service.dto.UpdateUserStatusRequest;
import com.bank.user_service.dto.UserStatus;
import com.bank.user_service.entity.User;
import com.bank.user_service.exception.UserNotFoundException;
import com.bank.user_service.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.transaction.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Tag(name = "User Controller", description = "User Management System")
@RestController
@RequestMapping("/users")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private ErrorMessages errorMessages;

    /**
     * Open a new user account.
     * @param user The user details.
     * @param result The binding result for validation errors.
     * @return A response entity with the created user or error messages.
     */
    @Operation(summary = "Open a new user account")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Account created successfully"),
            @ApiResponse(responseCode = "400", description = "Validation errors"),
            @ApiResponse(responseCode = "409", description = "Data integrity violation"),
            @ApiResponse(responseCode = "500", description = "Unexpected error")
    })
    @Transactional
    @PostMapping(value = "/open-account", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> openAccount(@RequestBody User user, BindingResult result) {
        logger.info("Opening account for user: {}", user.getEmail());

        // Validate input data
        if (result.hasErrors()) {
            Map<String, String> errors = new HashMap<>();
            result.getFieldErrors().forEach(error -> errors.put(error.getField(), error.getDefaultMessage()));
            logger.warn("Validation errors: {}", errors);
            return ResponseEntity.badRequest().body(errors);
        }

        try {
            User createdUser = userService.openAccount(user);
            logger.info("Account created successfully for user: {}", user.getEmail());
            return new ResponseEntity<>(createdUser.getApplicationId(), HttpStatus.CREATED);
        } catch (DataIntegrityViolationException e) {
            logger.error("Data integrity violation: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.CONFLICT).body(errorMessages.getDuplicateEmailMessage());
        } catch (UnexpectedRollbackException e) {
            logger.error("Unexpected rollback: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorMessages.getUnexpectedErrorMessage());
        } catch (Exception e) {
            logger.error("Error opening account: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorMessages.getUnexpectedErrorMessage());
        }
    }

    /**
     * Get user status by application ID.
     * @param applicationId The application ID.
     * @return A response entity with the user status.
     */
    @Operation(summary = "Get user status by application ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "User status fetched successfully"),
            @ApiResponse(responseCode = "404", description = "User not found")
    })
    @GetMapping("/application/{applicationId}")
    public ResponseEntity<UserStatus> getUserByApplicationId(@PathVariable String applicationId) {
        logger.info("Fetching user by applicationId: {}", applicationId);
        try {
            User user = userService.getUserByApplicationId(applicationId);

            UserStatus accountStatus = new UserStatus();
            accountStatus.setIsActive(user.getIsActive());
            accountStatus.setComments(user.getComments());
            logger.info("User status fetched successfully for applicationId: {}", applicationId);
            return new ResponseEntity<>(accountStatus, HttpStatus.OK);
        } catch (UserNotFoundException e) {
            logger.error("User not found for applicationId: {}", applicationId);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    /**
     * Update user status.
     * @param request The update user status request.
     * @return A response entity with the updated user or error message.
     */
    @Operation(summary = "Update user status")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "User status updated successfully"),
            @ApiResponse(responseCode = "404", description = "User not found"),
            @ApiResponse(responseCode = "500", description = "Unexpected error")
    })
    @PostMapping(value = "/update-status", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> updateUserStatus(@RequestBody UpdateUserStatusRequest request) {
        logger.info("Updating user status for userId: {}", request.getUserId());
        try {
            User updatedUser = userService.updateUserStatus(request);
            logger.info("User status updated successfully for userId: {}", request.getUserId());
            return new ResponseEntity<>(updatedUser, HttpStatus.OK);
        } catch (UserNotFoundException e) {
            logger.error("User not found for userId: {}", request.getUserId());
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            logger.error("Error updating user status: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorMessages.getUnexpectedErrorMessage());
        }
    }

    /**
     * Get user by ID.
     * @param id The user ID.
     * @return A response entity with the user details.
     */
    @Operation(summary = "Get user by ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "User fetched successfully"),
            @ApiResponse(responseCode = "404", description = "User not found")
    })
    @GetMapping("/user/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        logger.info("Fetching user by id: {}", id);
        try {
            User user = userService.getUserByID(id);
            logger.info("User fetched successfully for id: {}", id);
            return new ResponseEntity<>(user, HttpStatus.OK);
        } catch (UserNotFoundException e) {
            logger.error("User not found for id: {}", id);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    /**
     * Get user by email.
     * @param email The user email.
     * @return A response entity with the user details.
     */
    @Operation(summary = "Get user by email")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "User fetched successfully"),
            @ApiResponse(responseCode = "404", description = "User not found")
    })
    @GetMapping("/{email}")
    public ResponseEntity<User> getUserByEmail(@PathVariable String email) {
        logger.info("Fetching user by email: {}", email);
        try {
            User user = userService.getUserByEmail(email);
            logger.info("User fetched successfully for email: {}", email);
            return new ResponseEntity<>(user, HttpStatus.OK);
        } catch (UserNotFoundException e) {
            logger.error("User not found for email: {}", email);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    /**
     * Get all users.
     * @return A response entity with the list of all users.
     */
    @Operation(summary = "Get all users")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Users fetched successfully")
    })
    @GetMapping("/all")
    public ResponseEntity<List<User>> getAllUsers() {
        logger.info("Fetching all users");
        List<User> users = userService.getAllUsers();
        logger.info("All users fetched successfully");
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    /**
     * Update user details.
     * @param id The user ID.
     * @param userDetails The user details to be updated.
     * @return A response entity with the updated user.
     */
    @Operation(summary = "Update user details")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "User details updated successfully"),
            @ApiResponse(responseCode = "404", description = "User not found")
    })
    @PutMapping("/update/{id}")
    public ResponseEntity<User> updateUser(@PathVariable Long id, @RequestBody User userDetails) {
        logger.info("Updating user details for id: {}", id);
        try {
            User updatedUser = userService.updateUser(id, userDetails);
            logger.info("User details updated successfully for id: {}", id);
            return new ResponseEntity<>(updatedUser, HttpStatus.OK);
        } catch (UserNotFoundException e) {
            logger.error("User not found for id: {}", id);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    /**
     * Delete user by ID.
     * @param id The user ID.
     * @return A response entity with a success message.
     */
    @Operation(summary = "Delete user by ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "User deleted successfully"),
            @ApiResponse(responseCode = "404", description = "User not found")
    })
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteUser(@PathVariable Long id) {
        logger.info("Deleting user with id: {}", id);
        try {
            userService.deleteUser(id);
            logger.info("User deleted successfully for id: {}", id);
            return new ResponseEntity<>("User deleted successfully", HttpStatus.OK);
        } catch (UserNotFoundException e) {
            logger.error("User not found for id: {}", id);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    /**
     * Get user by account number.
     * @param accountNumber The account number.
     * @return A response entity with the user details.
     */
    @Operation(summary = "Get user by account number")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "User fetched successfully"),
            @ApiResponse(responseCode = "404", description = "User not found")
    })
    @GetMapping("/account/{accountNumber}")
    public ResponseEntity<User> getUserByAccountNumber(@PathVariable String accountNumber) {
        logger.info("Fetching user by account number: {}", accountNumber);
        try {
            User user = userService.getUserByAccountNumber(accountNumber);
            logger.info("User fetched successfully for account number: {}", accountNumber);
            return new ResponseEntity<>(user, HttpStatus.OK);
        } catch (UserNotFoundException e) {
            logger.error("User not found for account number: {}", accountNumber);
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    /**
     * Get inactive and rejected users.
     * @return A list of inactive and rejected users.
     */
    @Operation(summary = "Get inactive and rejected users")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Users fetched successfully")
    })
    @GetMapping("/inactive-rejected")
    public ResponseEntity<List<User>> getInactiveAndRejectedUsers() {
        logger.info("Fetching inactive and rejected users");
        List<User> users = userService.getInactiveAndRejectedUsers();
        logger.info("Inactive and rejected users fetched successfully");
        return new ResponseEntity<>(users, HttpStatus.OK);
    }
}