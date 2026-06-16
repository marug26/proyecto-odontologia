package com.odontologia.dto;

import com.odontologia.entity.Invoice;
import com.odontologia.entity.EstadoFactura;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.UUID;

public record InvoiceResponse(
    UUID id,
    UUID patientId,
    String patientName,
    String invoiceNumber,
    LocalDate issueDate,
    LocalDate dueDate,
    BigDecimal subtotal,
    BigDecimal discount,
    BigDecimal total,
    BigDecimal paidAmount,
    EstadoFactura status,
    String notes,
    OffsetDateTime createdAt
) {
  public static InvoiceResponse from(Invoice invoice) {
    return new InvoiceResponse(
        invoice.getId(), invoice.getPatient().getId(), invoice.getPatient().getName(),
        invoice.getInvoiceNumber(), invoice.getIssueDate(), invoice.getDueDate(),
        invoice.getSubtotal(), invoice.getDiscount(), invoice.getTotal(),
        invoice.getPaidAmount(), invoice.getStatus(), invoice.getNotes(),
        invoice.getCreatedAt()
    );
  }
}
