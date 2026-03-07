package com.team.challenge.dto.hello;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class UserDto {
    private UUID id;
    private String username;
    private String email;

    @Override
    public String toString() {
        return "UserDto [id=" + id + ", "
               + "username=" + username + ", "
               + "email=" + email + "]";
    }
}
