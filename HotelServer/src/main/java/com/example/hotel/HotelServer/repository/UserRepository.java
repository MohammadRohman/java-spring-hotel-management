package com.example.hotel.HotelServer.repository;

import com.example.hotel.HotelServer.enums.UserRole;
import org.springframework.stereotype.Repository;
import com.example.hotel.HotelServer.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User ,Long>{
    Optional<User> findFirstByEmail(String email);

    Optional<User> findByUserRole(UserRole userRole);
}
