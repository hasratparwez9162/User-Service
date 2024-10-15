package com.bank.user_service.entity;
import com.bank.user_service.dto.Account;
import com.bank.user_service.dto.Card;
import com.bank.user_service.dto.Loan;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
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
@Table(name = "users",uniqueConstraints = {
        @UniqueConstraint(name = "UK_USER_EMAIL", columnNames = "email"),
        @UniqueConstraint(name = "UK_USER_PHONE_NUMBER", columnNames = "phone_number")
})
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    //personal info
    @NotBlank(message = "First name is required.")
    @Size(min = 2, max = 30, message = "First name must be between 2 and 30 characters.")
    @Pattern(regexp = "^[a-zA-Z]+$", message = "First name must contain only alphabetic characters.")
    @Column(nullable = false,length = 30)
    private String firstName;

    @NotBlank(message = "Last name is required.")
    @Size(min = 2, max = 30, message = "Last name must be between 2 and 30 characters.")
    @Pattern(regexp = "^[a-zA-Z]+$", message = "Last name must contain only alphabetic characters.")
    @Column(nullable = false,length = 30)
    private String lastName;


    @Column(nullable = false)
    private String gender;

    private LocalDate dateOfBirth;

    @NotBlank(message = "Email is required.")
    @Email(message = "Please enter a valid email address.")
    @Column(name = "email",unique = true)
    private String email;

    @NotBlank(message = "Phone number is required.")
    @Pattern(regexp = "^[0-9]{10}$", message = "Phone number must be exactly 10 digits.")
    @Column(name = "phone_number",unique = true,nullable = false ,length = 10)
    private String phoneNumber;


    private String alternatePhoneNumber;

    //Address info
    @NotBlank(message = "Address is required.")
    @Pattern(regexp = "^[a-zA-Z0-9#][a-zA-Z0-9\\s,.-]*$", message = "Address contains invalid characters or starts with an invalid character.")
    @Column(nullable = false)
    private String address;

    @NotBlank(message = "State is required.")
    @Size(min = 2, max = 50, message = "State must be between 2 and 50 characters.")
    @Pattern(regexp = "^[a-zA-Z ]+$", message = "State must contain only alphabetic characters.")
    @Column(nullable = false, length = 50)
    private String state;

    @NotBlank(message = "Zip is required.")
    @Pattern(regexp = "^[0-9]{6}$", message = "Please enter a valid 6-digit zip code.")
    @Column(nullable = false,length = 6)
    private String zip;


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
