package com.odontologia.dto;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.UUID;

import com.odontologia.entity.EstadoFactura;
import com.odontologia.entity.Factura;
import com.odontologia.entity.MetodoPago;

public record InvoiceResponse(
    UUID id,
    UUID pacienteId,
    String pacienteNombres,
    String numeroFactura,
    LocalDate fechaEmision,
    BigDecimal total,
    MetodoPago metodoDePago,
    EstadoFactura status,
    OffsetDateTime createdAt
) {
  public static InvoiceResponse from(Factura factura) {
    return new InvoiceResponse(
        factura.getId(),
        factura.getPacienteFacturado().getId(),
        factura.getPacienteFacturado().getNombres() + " " + factura.getPacienteFacturado().getApellidos(),
        factura.getNumeroFactura(),
        factura.getFechaEmision(),
        factura.getTotal(),
        factura.getMetodoDePago(),
        factura.getEstadoFactura(),
        factura.getCreatedAt()
    );
  }
}
