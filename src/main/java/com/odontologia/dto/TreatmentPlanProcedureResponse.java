package com.odontologia.dto;

import com.odontologia.entity.TreatmentPlanProcedure;
import java.math.BigDecimal;
import java.util.UUID;

public record TreatmentPlanProcedureResponse(
    UUID id,
    UUID procedureId,
    String procedureCode,
    String procedureName,
    Short toothNumber,
    String surface,
    String notes,
    Short sequenceOrder,
    BigDecimal estimatedFee,
    String status
) {
  public static TreatmentPlanProcedureResponse from(TreatmentPlanProcedure tpp) {
    return new TreatmentPlanProcedureResponse(
        tpp.getId(), tpp.getProcedure().getId(), tpp.getProcedure().getCode(),
        tpp.getProcedure().getName(), tpp.getToothNumber(), tpp.getSurface(),
        tpp.getNotes(), tpp.getSequenceOrder(), tpp.getEstimatedFee(),
        tpp.getStatus().name()
    );
  }
}
