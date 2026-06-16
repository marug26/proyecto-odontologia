package com.odontologia.entity;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "empleado")
@Getter
@Setter
@NoArgsConstructor
public class Empleado extends Persona {

  @Enumerated(EnumType.STRING)
  @Column(nullable = false, length = 20)
  private RolEmpleado rol;

  @Column(nullable = false)
  private boolean active = true;

  public Collection<? extends GrantedAuthority> getAuthorities() {
    return List.of(new SimpleGrantedAuthority("ROLE_" + rol.name()));
  }
  // permite saber qué permisos tiene el empleado según su rol, lo que es útil para controlar el acceso a ciertas funcionalidades en la aplicación.
}
