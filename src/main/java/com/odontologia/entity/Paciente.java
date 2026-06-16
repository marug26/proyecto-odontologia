package com.odontologia.entity;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "paciente")
@Getter
@Setter
@NoArgsConstructor
public class Paciente extends Persona {

  @Column(length = 20)
  private String telefono;

  @Column(nullable = false)
  private LocalDate fechaNacimiento;

  @Column(length = 255)
  private String direccion;

  @Column(nullable = false)
  @Enumerated(EnumType.STRING)
  private TipoPaciente tipoPaciente;

  @OneToMany(mappedBy = "paciente")
  private List<Cita> citas;

  @OneToOne(mappedBy = "paciente")
  private HistoriaClinica historiaClinica;

  @OneToMany(mappedBy = "pacienteFacturado")
  private List<Factura> facturas;
}
