package com.tomo.tomo.test.repository;

import com.tomo.tomo.test.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Integer> {
    User findByUserId(String userId);
}
