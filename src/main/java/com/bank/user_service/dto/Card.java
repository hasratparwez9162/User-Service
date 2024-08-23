package com.bank.user_service.dto;

import jakarta.persistence.Column;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Card {
    private Long id;

    private String cardNumber;

    private String cardHolderName;

    @Enumerated(EnumType.STRING)
    private CardType cardType;  // Enum (e.g., DEBIT, CREDIT)

    private BigDecimal creditLimit;  // For credit cards

    private BigDecimal availableLimit;  // Remaining limit for the card

    private LocalDate expiryDate;

    private Long userId;  // Foreign key to the User entity

    @Enumerated(EnumType.STRING)
    private CardStatus status;  // Enum for ACTIVE, BLOCKED, etc.
}
enum CardStatus{
    ACTIVE, BLOCKED, EXPIRED
}
enum CardType{
    DEBIT, CREDIT
}