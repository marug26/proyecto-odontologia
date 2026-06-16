package com.odontologia.dto;

import com.odontologia.entity.Staff;
import com.odontologia.entity.RolEmpleado;
import java.util.UUID;

public record StaffResponse(
    UUID id,
    String name,
    String email,
    RolEmpleado role,
    String specialization,
    String phone,
    boolean active
) {
  public static StaffResponse from(Staff staff) {
    return new StaffResponse(
        staff.getId(),
        staff.getName(),
        staff.getEmail(),
        staff.getRole(),
        staff.getSpecialization(),
        staff.getPhone(),
        staff.isActive()
    );
  }
}
