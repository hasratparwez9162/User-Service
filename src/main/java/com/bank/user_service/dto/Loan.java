package com.bank.user_service.dto;

import jakarta.persistence.Column;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Loan {
    private Long id;

    private Long userId;
    private String loanNumber;
    private LoanType loanType;

    private BigDecimal loanAmount;

    private BigDecimal interestRate;

    private int tenureMonths;

    private LocalDate startDate;

    private LocalDate endDate;

    private BigDecimal remainingBalance;

    private String loanStatus;
}
