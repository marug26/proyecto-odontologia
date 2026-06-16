package com.odontologia.dto;

import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.UUID;

public record AppointmentRequest(
    @NotNull UUID patientId,
    @NotNull UUID staffId,
    @NotNull LocalDate appointmentDate,
    @NotNull LocalTime startTime,
    @NotNull LocalTime endTime,
    String type,
    String reason,
    String notes
) {}
