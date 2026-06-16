package com.odontologia.dto;

import com.odontologia.entity.Payment;
import com.odontologia.entity.MetodoPago;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.UUID;

public record PaymentResponse(
    UUID id,
    UUID invoiceId,
    BigDecimal amount,
    MetodoPago paymentMethod,
    LocalDate paymentDate,
    String reference,
    String notes
) {
  public static PaymentResponse from(Payment payment) {
    return new PaymentResponse(
        payment.getId(), payment.getInvoice().getId(), payment.getAmount(),
        payment.getPaymentMethod(), payment.getPaymentDate(), payment.getReference(),
        payment.getNotes()
    );
  }
}
