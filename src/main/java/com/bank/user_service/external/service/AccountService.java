package com.bank.user_service.external.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.bank.user_service.dto.Account;

import java.util.List;

@FeignClient(name = "ACCOUNT-SERVICE")
public interface AccountService {

    /**
     * Adds a new account.
     * @param account The account details.
     * @return The created account.
     */
    @PostMapping("/account/open")
    Account addAccount(@RequestBody Account account);

    /**
     * Retrieves accounts by user ID.
     * @param id The user ID.
     * @return The list of accounts.
     */
    @GetMapping("/account/user/{id}")
    List<Account> getAccountById(@PathVariable Long id);

    /**
     * Retrieves account details by account number.
     * @param accountNumber The account number.
     * @return The account details.
     */
    @GetMapping("/account/{accountNumber}")
    Account getAccountByAccountNumber(@PathVariable String accountNumber);
}