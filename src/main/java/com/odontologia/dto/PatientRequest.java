package com.odontologia.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDate;
import com.odontologia.entity.TipoPaciente;

public record PatientRequest(
    @NotBlank String nombres,
    @NotBlank String apellidos,
    String email,
    String telefono,
    @NotNull LocalDate fechaNacimiento,
    String direccion,
    @NotNull TipoPaciente tipoPaciente,
    String identificacion
) {}
