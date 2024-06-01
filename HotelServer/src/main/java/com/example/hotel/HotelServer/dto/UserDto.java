package com.example.hotel.HotelServer.dto;

import com.example.hotel.HotelServer.enums.UserRole;
import lombok.Data;

@Data
public class UserDto {

    private Long id;
    private String email;
    private String name;
    private UserRole userRole;}

    // Constructor (optional)

