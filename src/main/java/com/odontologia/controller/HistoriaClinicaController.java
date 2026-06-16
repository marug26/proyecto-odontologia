package com.odontologia.controller;

import com.odontologia.dto.HistoriaClinicaRequest;
import com.odontologia.dto.HistoriaClinicaResponse;
import com.odontologia.service.HistoriaClinicaService;
import jakarta.validation.Valid;
import java.util.UUID;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/patients/{patientId}/historia-clinica")
public class HistoriaClinicaController {

  private final HistoriaClinicaService historiaClinicaService;

  public HistoriaClinicaController(HistoriaClinicaService historiaClinicaService) {
    this.historiaClinicaService = historiaClinicaService;
  }

  @GetMapping
  public HistoriaClinicaResponse findByPatient(@PathVariable UUID patientId) {
    return historiaClinicaService.findByPatientId(patientId);
  }

  @PutMapping
  public ResponseEntity<HistoriaClinicaResponse> upsert(@PathVariable UUID patientId,
      @Valid @RequestBody HistoriaClinicaRequest request) {
    var response = historiaClinicaService.upsert(patientId, request);
    return ResponseEntity.ok(response);
  }
}
