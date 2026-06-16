package com.odontologia.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "odontologo")
@Getter
@Setter
@NoArgsConstructor
public class Odontologo extends Empleado {

  @Column(nullable = false, unique = true, length = 255)
  private Integer registroProfesional;

  @Column(length = 100, nullable = false)
  private String especialidad;

  @OneToMany(mappedBy = "odontologo")
  private List<Cita> citasProgramadas;
}
