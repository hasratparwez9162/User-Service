package com.bank.user_service.external.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.bank.user_service.dto.Account;

import java.util.List;


@FeignClient(name = "ACCOUNT-SERVICE")
public interface AccountService {

    @PostMapping("/account/open")
    Account addAccount(@RequestBody Account account);

    @GetMapping("/account/user-account/{id}")
    List<Account> getAccountById(@PathVariable Long id);

    @GetMapping("/account/details/{accountNumber}")
    Account getAccountByAccountNumber(@PathVariable String accountNumber);



}
