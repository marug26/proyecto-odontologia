package com.odontologia.dto;

import com.odontologia.entity.Empleado;
import com.odontologia.entity.RolEmpleado;
import java.util.UUID;

public record StaffResponse(
    UUID id,
    String nombres,
    String apellidos,
    String email,
    RolEmpleado rol,
    String identificacion,
    boolean active
) {
  public static StaffResponse from(Empleado empleado) {
    return new StaffResponse(
        empleado.getId(),
        empleado.getNombres(),
        empleado.getApellidos(),
        empleado.getEmail(),
        empleado.getRol(),
        empleado.getIdentificacion(),
        empleado.isActive()
    );
  }
}
