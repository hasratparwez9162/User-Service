package com.bank.user_service.external.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.bank.user_service.dto.Loan;

import java.util.List;

@FeignClient(name = "LOANS-SERVICE")
public interface LoanService {

    /**
     * Retrieves loans by user ID.
     * @param userId The user ID.
     * @return The list of loans.
     */
    @GetMapping("/loan/user/{userId}")
    List<Loan> getLoansByUserId(@PathVariable Long userId);
}