package com.odontologia.dto;

import com.odontologia.entity.Procedimiento;
import java.math.BigDecimal;
import java.util.UUID;

public record ProcedureResponse(
    UUID id,
    String codigo,
    String nombre,
    String descripcion,
    Short duracionMinutos,
    BigDecimal valor
) {
  public static ProcedureResponse from(Procedimiento procedimiento) {
    return new ProcedureResponse(
        procedimiento.getId(),
        procedimiento.getCodigo(),
        procedimiento.getNombre(),
        procedimiento.getDescripcion(),
        procedimiento.getDuracionMinutos(),
        procedimiento.getValor()
    );
  }
}
