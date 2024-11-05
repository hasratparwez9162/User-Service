package com.bank.user_service.service.serviceImpl;

import com.bank.core.entity.UserNotification;
import com.bank.user_service.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
public class UserEventProducer {

    private static final Logger logger = LoggerFactory.getLogger(UserEventProducer.class);
    private static final String USER_TOPIC = "user-service-topic";

    @Autowired
    private KafkaTemplate<String, Object> kafkaTemplate;

    /**
     * Sends a message to the Kafka topic indicating that a user has been created.
     * @param user The user entity.
     */
    public void sendUserCreatedMessage(User user) {
        UserNotification userNotification = new UserNotification(
                user.getId(),
                user.getFirstName() + " " + user.getLastName(),
                user.getEmail(),
                user.getPhoneNumber(),
                user.getIsActive(),
                user.getComments(),
                user.getApplicationId()
        );
        logger.info("Sending user created message for user ID: {}", user.getId());
        kafkaTemplate.send(USER_TOPIC, "User Created", userNotification);
        logger.info("User created message sent successfully for user ID: {}", user.getId());
    }

    /**
     * Sends a message to the Kafka topic indicating that a user has been updated.
     * @param user The user entity.
     */
    public void sendUserUpdatedMessage(User user) {
        UserNotification userNotification = new UserNotification(
                user.getId(),
                user.getFirstName() + " " + user.getLastName(),
                user.getEmail(),
                user.getPhoneNumber(),
                user.getIsActive(),
                user.getComments(),
                user.getApplicationId()
        );
        logger.info("Sending user updated message for user ID: {}", user.getId());
        kafkaTemplate.send(USER_TOPIC, "User Updated", userNotification);
        logger.info("User updated message sent successfully for user ID: {}", user.getId());
    }
}