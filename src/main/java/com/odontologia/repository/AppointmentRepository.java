package com.odontologia.repository;

import com.odontologia.entity.Cita;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AppointmentRepository extends JpaRepository<Cita, UUID> {

  List<Cita> findByPacienteIdOrderByFechaCitaDescHoraCitaDesc(UUID pacienteId);

  List<Cita> findByOdontologoIdAndFechaCitaOrderByHoraCita(UUID odontologoId, LocalDate fechaCita);
}
