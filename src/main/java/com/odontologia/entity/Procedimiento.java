package com.odontologia.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.OneToOne;


import java.math.BigDecimal;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "procedimiento")
@Getter
@Setter
@NoArgsConstructor
public class Procedimiento extends BaseEntity {

  @Column(nullable = false, unique = true, length = 20)
  private short codigo;

  @Column(nullable = false, length = 200)
  private String nombre;

  @Column(columnDefinition = "TEXT")
  // forzar a la base de datos a crear una columna de tipo texto ilimitado
  private String descripcion;

  @Column(nullable = false)
  private byte duracionMinutos;

  @Column(nullable = false, precision = 10, scale = 2)
  private BigDecimal valor;

  @OneToOne(mappedBy = "procedimiento")
  private ProcedimientoRealizado procedimientoRealizado;

}