package com.odontologia.dto;

import com.odontologia.entity.TreatmentPlanStatus;
import jakarta.validation.constraints.NotNull;

public record TreatmentPlanStatusRequest(
    @NotNull TreatmentPlanStatus status
) {}
