package com.yukado.sbwebshop.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.yukado.sbwebshop.model.User;
import com.yukado.sbwebshop.web.dto.UserRegistrationDto;

public interface UserService extends UserDetailsService {

    User findByEmail(String email);

    User save(UserRegistrationDto registration);
}