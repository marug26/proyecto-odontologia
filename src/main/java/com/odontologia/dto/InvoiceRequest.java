package com.odontologia.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public record InvoiceRequest(
    @NotNull UUID patientId,
    LocalDate issueDate,
    LocalDate dueDate,
    @PositiveOrZero BigDecimal discount,
    String notes,
    List<InvoiceItemRequest> items
) {

  public record InvoiceItemRequest(
      @NotNull String description,
      @NotNull Short quantity,
      @NotNull BigDecimal unitPrice
  ) {}
}
