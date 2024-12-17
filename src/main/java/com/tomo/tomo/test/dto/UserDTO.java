package com.tomo.tomo.test.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class UserDTO {
    private int id;
    private String userId;
    private String userPw;
    private String userName;
    private String userNicName;
    private String userBirth;
    private String userEmail;
    private String gender;
}
