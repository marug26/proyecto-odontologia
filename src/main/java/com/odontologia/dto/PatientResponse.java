package com.odontologia.dto;

import com.odontologia.entity.Paciente;
import java.time.LocalDate;
import java.util.UUID;

public record PatientResponse(
    UUID id,
    String name,
    String email,
    String phone,
    LocalDate birthDate,
    String gender,
    String cpf,
    String addressStreet,
    String addressNumber,
    String addressComplement,
    String addressNeighborhood,
    String addressCity,
    String addressState,
    String addressZip,
    String emergencyContactName,
    String emergencyContactPhone,
    String responsiblePerson,
    String medicalHistory,
    String medications,
    String allergies,
    String odontogram,
    String notes,
    boolean active
) {
  public static PatientResponse from(Paciente patient) {
    return new PatientResponse(
        patient.getId(), patient.getName(), patient.getEmail(), patient.getPhone(),
        patient.getBirthDate(), patient.getGender(), patient.getCpf(),
        patient.getAddressStreet(), patient.getAddressNumber(), patient.getAddressComplement(),
        patient.getAddressNeighborhood(), patient.getAddressCity(), patient.getAddressState(),
        patient.getAddressZip(), patient.getEmergencyContactName(), patient.getEmergencyContactPhone(),
        patient.getResponsiblePerson(), patient.getMedicalHistory(), patient.getMedications(),
        patient.getAllergies(), patient.getOdontogram(), patient.getNotes(), patient.isActive()
    );
  }
}
