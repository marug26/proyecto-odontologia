package com.odontologia.service;

import com.odontologia.entity.Procedimiento;
import com.odontologia.repository.ProcedureRepository;
import com.odontologia.dto.ProcedureResponse;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class ProcedureService {

  private final ProcedureRepository procedureRepository;

  public ProcedureService(ProcedureRepository procedureRepository) {
    this.procedureRepository = procedureRepository;
  }

  public List<ProcedureResponse> findAll() {
    return procedureRepository.findByActiveTrueOrderByCode().stream()
        .map(ProcedureResponse::from)
        .toList();
  }

  public List<ProcedureResponse> findAllAdmin() {
    return procedureRepository.findAll().stream()
        .map(ProcedureResponse::from)
        .toList();
  }
}
