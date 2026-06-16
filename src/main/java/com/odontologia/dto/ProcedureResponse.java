package com.odontologia.dto;

import com.odontologia.entity.Procedimiento;
import java.math.BigDecimal;
import java.util.UUID;

public record ProcedureResponse(
    UUID id,
    String code,
    String name,
    String description,
    String category,
    Integer defaultDurationMinutes,
    BigDecimal defaultFee,
    boolean active
) {
  public static ProcedureResponse from(Procedimiento procedure) {
    return new ProcedureResponse(
        procedure.getId(), procedure.getCode(), procedure.getName(),
        procedure.getDescription(), procedure.getCategory(),
        procedure.getDefaultDurationMinutes(), procedure.getDefaultFee(),
        procedure.isActive()
    );
  }
}
