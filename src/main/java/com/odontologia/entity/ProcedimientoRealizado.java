package com.odontologia.entity;

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
@Table(name = "procedimiento_realizado")
@Getter
@Setter
@NoArgsConstructor
public class ProcedimientoRealizado extends BaseEntity {

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(nullable = false)
  private Cita cita;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(nullable = false)
  private Procedimiento procedimiento;

  @Column(nullable = true, precision = 2, scale = 0)
  private Short dienteNumero;

}
  