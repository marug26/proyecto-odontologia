package com.odontologia.controller;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.odontologia.dto.PatientRequest;
import com.odontologia.dto.PatientResponse;
import com.odontologia.service.PatientService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/pacientes")
public class PatientController {

  private final PatientService patientService;

  public PatientController(PatientService patientService) {
    this.patientService = patientService;
  }

  @GetMapping
  public List<PatientResponse> findAll() {
    return patientService.findAll();
  }

  @GetMapping("/{id}")
  public PatientResponse findById(@PathVariable UUID id) {
    return patientService.findById(id);
  }

  @PostMapping
  public ResponseEntity<PatientResponse> create(@Valid @RequestBody PatientRequest request) {
    var response = patientService.create(request);
    return ResponseEntity.status(HttpStatus.CREATED).body(response);
  }

  @PutMapping("/{id}")
  public PatientResponse update(@PathVariable UUID id, @Valid @RequestBody PatientRequest request) {
    return patientService.update(id, request);
  }

  @DeleteMapping("/{id}")
  @PreAuthorize("hasRole('ADMINISTRADOR')")
  public ResponseEntity<Void> delete(@PathVariable UUID id) {
    patientService.delete(id);
    return ResponseEntity.noContent().build();
  }
}
