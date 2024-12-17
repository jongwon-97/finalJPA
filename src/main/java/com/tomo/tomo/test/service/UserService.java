package com.tomo.tomo.test.service;

import com.tomo.tomo.test.dto.UserDTO;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    void saveUser(UserDTO userDTO); // 회원 저장
    UserDTO getUserByUserId(String userId); // 회원 조회
}
