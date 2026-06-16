package com.odontologia.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.odontologia.dto.ProcedureResponse;
import com.odontologia.repository.ProcedureRepository;

@Service
@Transactional(readOnly = true)
public class ProcedureService {

  private final ProcedureRepository procedureRepository;

  public ProcedureService(ProcedureRepository procedureRepository) {
    this.procedureRepository = procedureRepository;
  }

  public List<ProcedureResponse> findAll() {
    return procedureRepository.findAllByOrderByCodigo().stream()
        .map(ProcedureResponse::from)
        .toList();
  }

  public List<ProcedureResponse> findAllAdmin() {
    return procedureRepository.findAll().stream()
        .map(ProcedureResponse::from)
        .toList();
  }
}
