package com.team.challenge.controller;

import com.team.challenge.dto.hello.UserDto;
import com.team.challenge.dto.hello.HelloResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RequestMapping("/api/v1")
@RestController
@Slf4j
public class HelloController {

    @GetMapping("/user")
    public ResponseEntity<UserDto> helloUser(@RequestParam String username,
                                             @RequestParam String email) {
        UserDto user = UserDto.builder()
                .id(UUID.randomUUID())
                .username(username)
                .email(email)
                .build();

        log.info("Received information about: {}", user);
        return ResponseEntity.ok(user);
    }


    @GetMapping("/hello")
    public ResponseEntity<HelloResponse> hello() {
        HelloResponse response = new HelloResponse();
        response.setMessage("안녕하세요");
        return ResponseEntity.ok(response);
    }
}
