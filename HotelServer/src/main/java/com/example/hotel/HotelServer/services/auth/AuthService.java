package com.example.hotel.HotelServer.services.auth;

import com.example.hotel.HotelServer.dto.SignUpRequest;
import com.example.hotel.HotelServer.dto.UserDto;

public interface AuthService {
    UserDto createUser(SignUpRequest signUpRequest);
}
