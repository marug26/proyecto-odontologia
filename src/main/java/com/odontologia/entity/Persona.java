package com.odontologia.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@MappedSuperclass 
public class Persona extends BaseEntity {
  @Column(nullable = false, length = 150)
  private String nombres;
  @Column(nullable = false, length = 150)
  private String apellidos;
  @Column(length = 20, unique = true)
  private String email;
  @Column(length = 20, unique = true, nullable = false)
  private String identificacion;
}
