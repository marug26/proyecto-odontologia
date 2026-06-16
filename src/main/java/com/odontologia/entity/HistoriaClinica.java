package com.odontologia.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "historia_clinica")
public class HistoriaClinica extends BaseEntity {
  
  @OneToOne (fetch = FetchType.LAZY)
  @JoinColumn(name = "paciente_id", nullable = false, unique = true)
  private List<Paciente> pacienteId;

  @OneToMany(fetch = FetchType.LAZY, mappedBy = "paciente")
  private List<Cita> citas;

  // @OneToMany(fetch = FetchType.LAZY, mappedBy = "procedimiento_id")
  // @JoinColumn(name = "procedimiento_id")
  // private List<Procedimiento> procedimientosRealizados;

  @Column(columnDefinition = "TEXT")
  private String observaciones;
}
