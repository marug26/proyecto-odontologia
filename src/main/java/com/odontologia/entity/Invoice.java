package com.odontologia.entity;

import java.math.BigDecimal;
import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "invoice")
@Getter
@Setter
@NoArgsConstructor
public class Invoice extends BaseEntity {

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

  private MetodoPago metodoDePago;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false, length = 20)
  private EstadoFactura status = EstadoFactura.PENDIENTE;

}
