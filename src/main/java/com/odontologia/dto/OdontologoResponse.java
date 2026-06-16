package com.odontologia.dto;

import com.odontologia.entity.Odontologo;
import java.util.UUID;

public record OdontologoResponse(
    UUID id,
    String nombres,
    String apellidos,
    String email,
    String identificacion,
    Integer registroProfesional,
    String especialidad,
    boolean active
) {
  public static OdontologoResponse from(Odontologo odontologo) {
    return new OdontologoResponse(
        odontologo.getId(),
        odontologo.getNombres(),
        odontologo.getApellidos(),
        odontologo.getEmail(),
        odontologo.getIdentificacion(),
        odontologo.getRegistroProfesional(),
        odontologo.getEspecialidad(),
        odontologo.isActive()
    );
  }
}
