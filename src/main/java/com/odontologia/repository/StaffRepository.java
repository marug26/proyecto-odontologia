package com.odontologia.repository;

import com.odontologia.entity.Empleado;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;


public interface StaffRepository extends JpaRepository<Empleado, UUID> {

  Optional<Empleado> findByGoogleSub(String googleSub);

  Optional<Empleado> findByEmail(String email);
}
