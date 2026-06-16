package com.odontologia.dto;

import com.odontologia.entity.RolEmpleado;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record StaffRequest(
    @NotBlank String name,
    @NotBlank @Email String email,
    @NotNull RolEmpleado role,
    String specialization,
    String phone
) {}
