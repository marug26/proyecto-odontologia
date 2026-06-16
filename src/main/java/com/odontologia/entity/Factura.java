package com.odontologia.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "factura")
@Getter
@Setter
@NoArgsConstructor
public class Factura extends BaseEntity {

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(nullable = false)
  private Paciente pacienteFacturado;

  @Column(nullable = false, unique = true, length = 20)
  private String numeroFactura;

  @Column(nullable = false)
  private LocalDate fechaEmision;

  // @Column(nullable = false, precision = 10, scale = 2)
  // private BigDecimal subtotal = BigDecimal.ZERO;

  // @Column(nullable = false, precision = 10, scale = 2)
  // private BigDecimal discount = BigDecimal.ZERO;

  @Column(nullable = false, precision = 10, scale = 2)
  private BigDecimal total = BigDecimal.ZERO;

  // @Column(nullable = false, precision = 10, scale = 2)
  // private BigDecimal valor_pagado = BigDecimal.ZERO;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false, name = "metodo_pago", length = 20)
  private MetodoPago metodoDePago;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false, name = "estado_factura", length = 20)
  private EstadoFactura estadoFactura = EstadoFactura.PENDIENTE;

  @OneToMany(mappedBy = "factura", fetch = FetchType.LAZY)
  private List<FacturaDetalle> facturaDetalles;

}
