package com.bank.user_service.external.service;

import com.bank.user_service.dto.Card;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@FeignClient(name = "CARDS-SERVICE")
public interface CardService {
    @GetMapping("/cards/user/{userId}")
    public List<Card> getCardsByUserId(@PathVariable Long userId);

}
