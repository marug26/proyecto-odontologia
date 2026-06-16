package com.odontologia.entity;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "detalle_factura")
@Getter
@Setter
@NoArgsConstructor
public class FacturaDetalle extends BaseEntity {

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(nullable = false)
  private Factura factura;

  @Column(nullable = false, length = 300)
  private String descripcion;

  @Column(nullable = false)
  private Short cantidad = 1;

  @Column(nullable = false, precision = 10, scale = 2)
  private BigDecimal valorUnitario;

  @Column(nullable = false, precision = 10, scale = 2)
  private BigDecimal total;
}
