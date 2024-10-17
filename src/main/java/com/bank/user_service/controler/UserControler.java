package com.bank.user_service.controler;

import com.bank.user_service.entity.User;
import com.bank.user_service.external.service.AccountService;
import com.bank.user_service.serviceImpl.UserServiceImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/users")
public class UserControler {

    private static final Logger logger = LoggerFactory.getLogger(UserControler.class);
    @Value("${upload.directory}")
    private String uploadDir;

    @Autowired
    UserServiceImpl userService;

    @Autowired
    AccountService accountService;
    @Transactional
    @PostMapping(value = "/open-account", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> openAccount(
            @RequestPart("user") String userJson,
            @RequestPart("picture") MultipartFile picture,
            @RequestPart("idProof") MultipartFile idProof,
            BindingResult result) throws IOException {

        // Validate input data
        if (result.hasErrors()) {
            Map<String, String> errors = new HashMap<>();
            result.getFieldErrors().forEach(error -> {
                errors.put(error.getField(), error.getDefaultMessage());
            });
            return ResponseEntity.badRequest().body(errors);
        }

        try {
            // Deserialize the user JSON string to User object
            ObjectMapper objectMapper = new ObjectMapper();
            User user = objectMapper.readValue(userJson, User.class);

            // Save the user entity in the database to generate an ID
            User newUser = userService.openAccount(user);

            // Save the picture and ID proof files
            String picturePath = saveFile(picture, newUser.getId(), "picture");
            String idProofPath = saveFile(idProof, newUser.getId(), "idProof");

            // Set file paths in the user object (assuming you have these fields in your User class)
            newUser.setPicturePath(picturePath);
            newUser.setIdProofPath(idProofPath);

            // Update the user entity with file paths
            userService.updateUser(newUser.getId(), newUser);

            // Return the newly created user details
            return new ResponseEntity<>(newUser, HttpStatus.CREATED);
        } catch (JsonProcessingException e) {
            logger.error("Error processing JSON: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid user data format");
        } catch (FileNotFoundException e) {
            logger.error("File not found: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("File not found");
        } catch (IOException e) {
            logger.error("I/O error: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error saving files");
        } catch (DataIntegrityViolationException e) {
            logger.error("Data integrity violation: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.CONFLICT).body("A user with the same phone number or email already exists");
        }catch (UnexpectedRollbackException e) {
            logger.error("Transaction rolled back: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Transaction rolled back due to an error");
        }
        catch (Exception e) {
            logger.error("Unexpected error: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An unexpected error occurred");
        }
    }

    @GetMapping("/user/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        User user = userService.getUserByID(id);
        return new ResponseEntity<>(user, HttpStatus.FOUND);
    }

    @GetMapping("/{email}")
    public ResponseEntity<User> getUserByEmail(@PathVariable String email) {
        User user = userService.getUserByEmail(email);
        return new ResponseEntity<>(user, HttpStatus.FOUND);
    }

    @GetMapping("/all")
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> users = userService.getAllUsers();
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<User> updateUser(@PathVariable Long id, @RequestBody User userDetails) {
        User updatedUser = userService.updateUser(id, userDetails);
        return new ResponseEntity<>(updatedUser, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return new ResponseEntity<>("User deleted successfully", HttpStatus.OK);
    }

    @GetMapping("/account/{accountNumber}")
    public ResponseEntity<User> getUserByAccountNumber(@PathVariable String accountNumber) {
        User user = userService.getUserByAccountNumber(accountNumber);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    // Method to save the file to the server's file system
    private String saveFile(MultipartFile file, Long userId, String type) throws IOException {
        // Define the directory to save files
        String directory = uploadDir + "/" + userId + "/";
        File dir = new File(directory);
        if (!dir.exists()) {
            if (!dir.mkdirs()) {
                throw new IOException("Failed to create directory: " + directory);
            }
        }

        // Create a file path
        String filePath = directory + type + "_" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File destinationFile = new File(filePath);

        // Save the file
        file.transferTo(destinationFile);

        return filePath; // Return the file path
    }

    // Check if the file is an image
    private boolean isImage(MultipartFile file) {
        String contentType = file.getContentType();
        return contentType != null && (contentType.equals("image/jpeg") || contentType.equals("image/jpg") || contentType.equals("image/png"));
    }

    // Check if the file is a PDF
    private boolean isPDF(MultipartFile file) {
        String contentType = file.getContentType();
        return contentType != null && contentType.equals("application/pdf");
    }
}