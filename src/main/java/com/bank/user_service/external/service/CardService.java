package com.bank.user_service.external.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.bank.user_service.dto.Card;

import java.util.List;

@FeignClient(name = "CARDS-SERVICE")
public interface CardService {

    /**
     * Retrieves cards by user ID.
     * @param userId The user ID.
     * @return The list of cards.
     */
    @GetMapping("/cards/user/{userId}")
    List<Card> getCardsByUserId(@PathVariable Long userId);
}