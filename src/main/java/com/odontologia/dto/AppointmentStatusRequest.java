package com.odontologia.dto;

import com.odontologia.entity.EstadoCita;
import jakarta.validation.constraints.NotNull;

public record AppointmentStatusRequest(
    @NotNull EstadoCita status
) {}
