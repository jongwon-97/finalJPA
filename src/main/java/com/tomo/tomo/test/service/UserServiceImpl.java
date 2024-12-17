package com.tomo.tomo.test.service;

import com.tomo.tomo.test.dto.UserDTO;
import com.tomo.tomo.test.entity.User;
import com.tomo.tomo.test.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;

public class UserServiceImpl implements UserService{
    @Autowired
    private UserRepository userRepository;

    @Override
    public void saveUser(UserDTO userDTO) {
        User user = User.builder()
                .userId(userDTO.getUserId())
                .userPw(userDTO.getUserPw())
                .userName(userDTO.getUserName())
                .userNicName(userDTO.getUserNicName())
                .userBirth(LocalDate.parse(userDTO.getUserBirth()))
                .userEmail(userDTO.getUserEmail())
                .gender(userDTO.getGender())
                .build();

        userRepository.save(user);
    }


    @Override
    public UserDTO getUserByUserId(String userId) {
        User user = userRepository.findByUserId(userId);
        return new UserDTO(
                user.getId(),
                user.getUserId(),
                user.getUserPw(),
                user.getUserName(),
                user.getUserNicName(),
                user.getUserBirth().toString(),
                user.getUserEmail(),
                user.getGender()
        );
    }
}
