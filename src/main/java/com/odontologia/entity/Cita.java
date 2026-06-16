package com.odontologia.entity;

import java.time.LocalDate;
import java.time.LocalTime;
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
@Table(name = "cita")
@Getter
@Setter
@NoArgsConstructor
public class Cita extends BaseEntity {

  @ManyToOne(fetch = FetchType.LAZY)
  // indica que los datos rel. se cargarán de la db solo cuando se invoquen explicitamente, lo que mejora el rendimiento al evitar cargas innecesarias.
  @JoinColumn(nullable = false)
  private Paciente paciente;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(nullable = false)
  private Odontologo odontologo;

  @Column(nullable = false)
  private LocalDate fechaCita;

  @Column(nullable = false)
  private LocalTime horaCita;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false)
  private Consultorio consultorioAsignado;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false, length = 20)
  private EstadoCita estadoCita = EstadoCita.PROGRAMADA;

  @Column(nullable = false, length = 255)
  private String motivoConsulta;

  @OneToMany(mappedBy = "cita")
  private List<ProcedimientoRealizado> procedimientosRealizados;

}
