package com.odontologia.dto;

import com.odontologia.entity.HistoriaClinica;
import java.time.OffsetDateTime;
import java.util.UUID;

public record HistoriaClinicaResponse(
    UUID id,
    UUID pacienteId,
    String pacienteNombres,
    String observaciones,
    OffsetDateTime createdAt,
    OffsetDateTime updatedAt
) {
  public static HistoriaClinicaResponse from(HistoriaClinica historia) {
    return new HistoriaClinicaResponse(
        historia.getId(),
        historia.getPaciente().getId(),
        historia.getPaciente().getNombres() + " " + historia.getPaciente().getApellidos(),
        historia.getObservaciones(),
        historia.getCreatedAt(),
        historia.getUpdatedAt()
    );
  }
}
