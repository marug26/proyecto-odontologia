package com.odontologia.controller;
import com.odontologia.dto.ClinicalNoteRequest;
import com.odontologia.dto.ClinicalNoteResponse;

import com.odontologia.service.ClinicalNoteService;
import jakarta.validation.Valid;
import java.util.UUID;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/appointments/{appointmentId}/clinical-note")
public class ClinicalNoteController {

  private final ClinicalNoteService clinicalNoteService;

  public ClinicalNoteController(ClinicalNoteService clinicalNoteService) {
    this.clinicalNoteService = clinicalNoteService;
  }

  @GetMapping
  @PreAuthorize("hasAnyRole('DENTIST', 'ADMIN')")
  public ClinicalNoteResponse findByAppointment(@PathVariable UUID appointmentId) {
    return clinicalNoteService.findByAppointment(appointmentId);
  }

  @PutMapping
  @PreAuthorize("hasAnyRole('DENTIST', 'ADMIN')")
  public ResponseEntity<ClinicalNoteResponse> upsert(@PathVariable UUID appointmentId,
      @Valid @RequestBody ClinicalNoteRequest request) {
    var response = clinicalNoteService.upsert(appointmentId, request);
    return ResponseEntity.ok(response);
  }
}
