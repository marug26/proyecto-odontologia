package com.odontologia.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.odontologia.dto.AppointmentRequest;
import com.odontologia.dto.AppointmentResponse;
import com.odontologia.dto.AppointmentStatusRequest;
import com.odontologia.service.AppointmentService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/citas")
public class AppointmentController {

  private final AppointmentService appointmentService;

  public AppointmentController(AppointmentService appointmentService) {
    this.appointmentService = appointmentService;
  }

  @GetMapping
  public List<AppointmentResponse> findAll() {
    return appointmentService.findAll();
  }

  @GetMapping("/{id}")
  public AppointmentResponse findById(@PathVariable UUID id) {
    return appointmentService.findById(id);
  }

  @PostMapping
  public ResponseEntity<AppointmentResponse> create(
      @Valid @RequestBody AppointmentRequest request) {
    var response = appointmentService.create(request);
    return ResponseEntity.status(HttpStatus.CREATED).body(response);
  }

  @PutMapping("/{id}")
  public AppointmentResponse update(@PathVariable UUID id,
      @Valid @RequestBody AppointmentRequest request) {
    return appointmentService.update(id, request);
  }

  @PatchMapping("/{id}/status")
  public AppointmentResponse changeStatus(@PathVariable UUID id,
      @Valid @RequestBody AppointmentStatusRequest request) {
    return appointmentService.changeStatus(id, request);
  }

  @DeleteMapping("/{id}")
  public ResponseEntity<Void> cancel(@PathVariable UUID id) {
    appointmentService.cancel(id);
    return ResponseEntity.noContent().build();
  }
}
