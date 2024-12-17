package com.tomo.tomo.test.controller;

import com.tomo.tomo.test.dto.UserDTO;
import com.tomo.tomo.test.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
public class TestController {

    private final UserService userService;

    @GetMapping("/signup")
    public String signup(){
        return "test/signup";
    }
    @PostMapping("/signup")
    public String signupProcess(UserDTO user){
        log.info("user======{}",user);
        //회원가입 처리
        userService.saveUser(user);
        log.info("가입한 회원 id=={}", user.getUserId());
        return "redirect:/";
    }

    @GetMapping("/test2")
    public String test2(){
        return "test/test2";
    }

    @GetMapping("/test3")
    public String test3(){
        return "test/test3";
    }
}
