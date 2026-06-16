package com.odontologia.dto;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import jakarta.validation.constraints.NotNull;

public record InvoiceRequest(
    @NotNull UUID pacienteId,
    @NotNull LocalDate fechaEmision,
    @NotNull List<InvoiceItemRequest> items
) {

  public record InvoiceItemRequest(
      @NotNull String descripcion,
      @NotNull Short cantidad,
      @NotNull BigDecimal valorUnitario
  ) {}
}
