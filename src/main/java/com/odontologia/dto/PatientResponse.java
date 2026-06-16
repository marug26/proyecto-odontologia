package com.odontologia.dto;

import com.odontologia.entity.Paciente;
import com.odontologia.entity.TipoPaciente;
import java.time.LocalDate;
import java.util.UUID;

public record PatientResponse(
    UUID id,
    String nombres,
    String apellidos,
    String email,
    String telefono,
    LocalDate fechaNacimiento,
    String direccion,
    TipoPaciente tipoPaciente,
    String identificacion
) {
  public static PatientResponse from(Paciente paciente) {
    return new PatientResponse(
        paciente.getId(),
        paciente.getNombres(),
        paciente.getApellidos(),
        paciente.getEmail(),
        paciente.getTelefono(),
        paciente.getFechaNacimiento(),
        paciente.getDireccion(),
        paciente.getTipoPaciente(),
        paciente.getIdentificacion()
    );
  }
}
