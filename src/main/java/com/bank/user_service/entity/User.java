package com.bank.user_service.entity;
import com.bank.user_service.dto.Account;
import com.bank.user_service.dto.Card;
import com.bank.user_service.dto.Loan;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    private String gender;
    private LocalDate dateOfBirth;
    private String address;
    private String state;
    private String zip;
    @Column(unique = true)
    private String email;
    @Column(unique = true)
    private String phoneNumber;
    private String alternatePhoneNumber;
    @CreationTimestamp
    private LocalDateTime createdAt;
    @UpdateTimestamp
    private LocalDateTime modifiedAt;
    @Transient
    private List<Account> accounts;
    @Transient
    private List<Loan> loans;
    @Transient
    private List<Card> cards;
    @Transient
    private String accountType;
}
