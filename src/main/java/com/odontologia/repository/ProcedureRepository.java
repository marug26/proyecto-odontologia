package com.odontologia.repository;

import com.odontologia.entity.Procedimiento;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProcedureRepository extends JpaRepository<Procedimiento, UUID> {

  List<Procedimiento> findByActiveTrueOrderByCode();
}
