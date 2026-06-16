package com.odontologia.dto;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.UUID;

import com.odontologia.entity.Cita;
import com.odontologia.entity.Consultorio;
import com.odontologia.entity.EstadoCita;

public record AppointmentResponse(
    UUID id,
    UUID pacienteId,
    String pacienteNombres,
    UUID odontologoId,
    String odontologoNombres,
    LocalDate fechaCita,
    LocalTime horaCita,
    Consultorio consultorioAsignado,
    EstadoCita status,
    String motivoConsulta
) {
  public static AppointmentResponse from(Cita cita) {
    return new AppointmentResponse(
        cita.getId(),
        cita.getPaciente().getId(),
        cita.getPaciente().getNombres() + " " + cita.getPaciente().getApellidos(),
        cita.getOdontologo().getId(),
        cita.getOdontologo().getNombres() + " " + cita.getOdontologo().getApellidos(),
        cita.getFechaCita(),
        cita.getHoraCita(),
        cita.getConsultorioAsignado(),
        cita.getEstadoCita(),
        cita.getMotivoConsulta()
    );
  }
}
