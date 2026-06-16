package com.odontologia.dto;

import com.odontologia.entity.MetodoPago;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import java.math.BigDecimal;
import java.time.LocalDate;

public record PaymentRequest(
    @NotNull @Positive BigDecimal amount,
    @NotNull MetodoPago paymentMethod,
    LocalDate paymentDate,
    String reference,
    String notes
) {}
