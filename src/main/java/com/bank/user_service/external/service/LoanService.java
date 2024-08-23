package com.bank.user_service.external.service;

import com.bank.user_service.dto.Loan;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@FeignClient(name = "LOANS-SERVICE")
public interface LoanService {
    @GetMapping("/loans/user/{userId}")
    public List<Loan> getLoansByUserId(@PathVariable Long userId);
}
