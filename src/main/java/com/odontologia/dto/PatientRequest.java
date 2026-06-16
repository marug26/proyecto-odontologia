package com.odontologia.dto;

import jakarta.validation.constraints.NotBlank;
import java.time.LocalDate;

public record PatientRequest(
    @NotBlank String name,
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
    String notes
) {}
