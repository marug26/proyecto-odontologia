package com.odontologia.controller;
import com.odontologia.dto.ProcedureResponse;

import com.odontologia.service.ProcedureService;
import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/procedures")
public class ProcedureController {

  private final ProcedureService procedureService;

  public ProcedureController(ProcedureService procedureService) {
    this.procedureService = procedureService;
  }

  @GetMapping
  public List<ProcedureResponse> findAll() {
    return procedureService.findAll();
  }

  @GetMapping("/all")
  @PreAuthorize("hasRole('ADMIN')")
  public List<ProcedureResponse> findAllAdmin() {
    return procedureService.findAllAdmin();
  }
}
