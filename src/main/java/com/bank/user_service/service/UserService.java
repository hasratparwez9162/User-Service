package com.bank.user_service.service;

import com.bank.user_service.dto.UpdateUserStatusRequest;
import com.bank.user_service.entity.User;

import java.util.List;

public interface UserService {

    /**
     * Opens a new account for the user.
     * @param user The user entity.
     * @return The saved user entity.
     */
    User openAccount(User user);

    /**
     * Retrieves a user by application ID.
     * @param applicationId The application ID.
     * @return The user entity.
     */
    User getUserByApplicationId(String applicationId);

    /**
     * Updates the status of a user.
     * @param request The update request.
     * @return The updated user entity.
     */
    User updateUserStatus(UpdateUserStatusRequest request);

    /**
     * Retrieves a list of inactive and rejected users.
     * @return The list of users.
     */
    List<User> getInactiveAndRejectedUsers();

    /**
     * Retrieves a user by ID.
     * @param id The user ID.
     * @return The user entity.
     */
    User getUserByID(Long id);

    /**
     * Retrieves all users.
     * @return The list of users.
     */
    List<User> getAllUsers();

    /**
     * Retrieves a user by email.
     * @param email The email address.
     * @return The user entity.
     */
    User getUserByEmail(String email);

    /**
     * Updates a user.
     * @param id The user ID.
     * @param userDetails The user details to update.
     * @return The updated user entity.
     */
    User updateUser(Long id, User userDetails);

    /**
     * Deletes a user by ID.
     * @param id The user ID.
     */
    void deleteUser(Long id);

    /**
     * Retrieves a user by account number.
     * @param accountNumber The account number.
     * @return The user entity.
     */
    User getUserByAccountNumber(String accountNumber);
}