package com.odontologia.controller;
import com.odontologia.dto.TreatmentPlanRequest;
import com.odontologia.dto.TreatmentPlanResponse;
import com.odontologia.dto.TreatmentPlanStatusRequest;
import com.odontologia.dto.AddProcedureRequest;
import com.odontologia.dto.TreatmentPlanProcedureResponse;

import com.odontologia.service.TreatmentPlanService;
import jakarta.validation.Valid;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class TreatmentPlanController {

  private final TreatmentPlanService treatmentPlanService;

  public TreatmentPlanController(TreatmentPlanService treatmentPlanService) {
    this.treatmentPlanService = treatmentPlanService;
  }

  @PostMapping("/patients/{patientId}/treatment-plans")
  public ResponseEntity<TreatmentPlanResponse> create(@PathVariable UUID patientId,
      @Valid @RequestBody TreatmentPlanRequest request) {
    var response = treatmentPlanService.create(patientId, request);
    return ResponseEntity.status(HttpStatus.CREATED).body(response);
  }

  @GetMapping("/patients/{patientId}/treatment-plans")
  public List<TreatmentPlanResponse> findByPatient(@PathVariable UUID patientId) {
    return treatmentPlanService.findByPatient(patientId);
  }

  @GetMapping("/treatment-plans/{id}")
  public TreatmentPlanResponse findById(@PathVariable UUID id) {
    return treatmentPlanService.findById(id);
  }

  @PutMapping("/treatment-plans/{id}")
  public TreatmentPlanResponse update(@PathVariable UUID id,
      @Valid @RequestBody TreatmentPlanRequest request) {
    return treatmentPlanService.update(id, request);
  }

  @PatchMapping("/treatment-plans/{id}/status")
  public TreatmentPlanResponse changeStatus(@PathVariable UUID id,
      @Valid @RequestBody TreatmentPlanStatusRequest request) {
    return treatmentPlanService.changeStatus(id, request);
  }

  @GetMapping("/treatment-plans/{id}/procedures")
  public List<TreatmentPlanProcedureResponse> findProcedures(@PathVariable UUID id) {
    return treatmentPlanService.findProcedures(id);
  }

  @PostMapping("/treatment-plans/{id}/procedures")
  public ResponseEntity<TreatmentPlanProcedureResponse> addProcedure(@PathVariable UUID id,
      @Valid @RequestBody AddProcedureRequest request) {
    var response = treatmentPlanService.addProcedure(id, request);
    return ResponseEntity.status(HttpStatus.CREATED).body(response);
  }

  @PatchMapping("/treatment-plans/procedures/{procedureId}/complete")
  public ResponseEntity<Void> markProcedureCompleted(@PathVariable UUID procedureId) {
    treatmentPlanService.markProcedureCompleted(procedureId);
    return ResponseEntity.noContent().build();
  }
}
