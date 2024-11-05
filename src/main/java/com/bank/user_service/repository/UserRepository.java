package com.bank.user_service.repository;

import com.bank.user_service.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    User findByEmail(String email);

    boolean existsByApplicationId(String applicationId);

    Optional<User> findByApplicationId(String applicationId);
    @Query("SELECT u FROM User u WHERE u.isActive IN ('INACTIVE', 'REJECTED')")
    List<User> findInactiveAndRejectedUsers();

}
