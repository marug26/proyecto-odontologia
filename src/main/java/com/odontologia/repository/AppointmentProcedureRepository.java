package com.odontologia.repository;

import com.odontologia.entity.ProcedimientoRealizado;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AppointmentProcedureRepository extends JpaRepository<ProcedimientoRealizado, UUID> {

  List<ProcedimientoRealizado> findByCitaId(UUID citaId);
}
