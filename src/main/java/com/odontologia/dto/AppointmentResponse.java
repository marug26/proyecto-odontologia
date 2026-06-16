package com.odontologia.dto;

import com.odontologia.entity.Cita;
import com.odontologia.entity.EstadoCita;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.UUID;

public record AppointmentResponse(
    UUID id,
    UUID patientId,
    String patientName,
    UUID staffId,
    String staffName,
    LocalDate appointmentDate,
    LocalTime startTime,
    LocalTime endTime,
    EstadoCita status,
    String type,
    String reason,
    String notes
) {
  public static AppointmentResponse from(Cita appointment) {
    return new AppointmentResponse(
        appointment.getId(),
        appointment.getPatient().getId(),
        appointment.getPatient().getName(),
        appointment.getStaff().getId(),
        appointment.getStaff().getName(),
        appointment.getAppointmentDate(),
        appointment.getStartTime(),
        appointment.getEndTime(),
        appointment.getStatus(),
        appointment.getType(),
        appointment.getReason(),
        appointment.getNotes()
    );
  }
}
