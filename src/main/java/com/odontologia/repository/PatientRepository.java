package com.odontologia.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.odontologia.entity.Paciente;

public interface PatientRepository extends JpaRepository<Paciente, UUID> {

  List<Paciente> findByNombresContainingIgnoreCase(String nombres);
}
