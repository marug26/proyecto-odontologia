package com.odontologia.entity;

import java.math.BigDecimal;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
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
  private String codigo;

  @Column(nullable = false, length = 200)
  private String nombre;

  @Column(columnDefinition = "TEXT")
  // forzar a la base de datos a crear una columna de tipo texto ilimitado
  private String descripcion;

  @Column(nullable = false)
  private short duracionMinutos;

  @Column(nullable = false, precision = 10, scale = 2)
  private BigDecimal valor;

  @OneToMany(mappedBy = "procedimiento")
  private List<ProcedimientoRealizado> procedimientosRealizados;

}