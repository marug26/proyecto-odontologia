package com.odontologia.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record OdontologoRequest(
    @NotBlank String nombres,
    @NotBlank String apellidos,
    @NotBlank @Email String email,
    @NotBlank String identificacion,
    @NotNull Integer registroProfesional,
    @NotBlank String especialidad
) {}
