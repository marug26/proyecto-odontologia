package com.odontologia.repository;

import com.odontologia.entity.HistoriaClinica;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HistoriaClinicaRepository extends JpaRepository<HistoriaClinica, UUID> {

  Optional<HistoriaClinica> findByPacienteId(UUID pacienteId);
}
