package com.odontologia.dto;

import com.odontologia.entity.TreatmentPlan;
import com.odontologia.entity.TreatmentPlanStatus;
import java.time.OffsetDateTime;
import java.util.UUID;

public record TreatmentPlanResponse(
    UUID id,
    UUID patientId,
    String patientName,
    String title,
    String description,
    TreatmentPlanStatus status,
    String notes,
    OffsetDateTime createdAt,
    OffsetDateTime updatedAt
) {
  public static TreatmentPlanResponse from(TreatmentPlan plan) {
    return new TreatmentPlanResponse(
        plan.getId(), plan.getPatient().getId(), plan.getPatient().getName(),
        plan.getTitle(), plan.getDescription(), plan.getStatus(), plan.getNotes(),
        plan.getCreatedAt(), plan.getUpdatedAt()
    );
  }
}
