package com.odontologia.dto;

import jakarta.validation.constraints.NotBlank;

public record TreatmentPlanRequest(
    @NotBlank String title,
    String description,
    String notes
) {}
