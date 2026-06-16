package com.odontologia.dto;

import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.UUID;

public record AddProcedureRequest(
    @NotNull UUID procedureId,
    Short toothNumber,
    String surface,
    String notes,
    @NotNull Short sequenceOrder,
    BigDecimal estimatedFee
) {}
