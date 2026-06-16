package com.odontologia.dto;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.UUID;

import jakarta.validation.constraints.NotNull;

public record AppointmentRequest(
    @NotNull UUID pacienteId,
    @NotNull UUID odontologoId,
    @NotNull LocalDate fechaCita,
    @NotNull LocalTime horaCita,
    @NotNull String motivoConsulta
) {}
