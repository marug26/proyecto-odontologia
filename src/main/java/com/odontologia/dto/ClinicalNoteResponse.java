package com.odontologia.dto;

import com.odontologia.entity.ClinicalNote;
import java.time.OffsetDateTime;
import java.util.UUID;

public record ClinicalNoteResponse(
    UUID id,
    UUID appointmentId,
    UUID patientId,
    String subjective,
    String objective,
    String assessment,
    String plan,
    OffsetDateTime createdAt,
    OffsetDateTime updatedAt
) {
  public static ClinicalNoteResponse from(ClinicalNote note) {
    return new ClinicalNoteResponse(
        note.getId(), note.getAppointment().getId(), note.getPatient().getId(),
        note.getSubjective(), note.getObjective(), note.getAssessment(), note.getPlan(),
        note.getCreatedAt(), note.getUpdatedAt()
    );
  }
}
