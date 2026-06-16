package com.odontologia.controller;

import com.odontologia.dto.OdontologoRequest;
import com.odontologia.dto.OdontologoResponse;
import com.odontologia.service.OdontologoService;
import jakarta.validation.Valid;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/odontologos")
public class OdontologoController {

  private final OdontologoService odontologoService;

  public OdontologoController(OdontologoService odontologoService) {
    this.odontologoService = odontologoService;
  }

  @GetMapping
  public List<OdontologoResponse> findAll() {
    return odontologoService.findAll();
  }

  @GetMapping("/{id}")
  public OdontologoResponse findById(@PathVariable UUID id) {
    return odontologoService.findById(id);
  }

  @PostMapping
  @PreAuthorize("hasRole('ADMINISTRADOR')")
  public ResponseEntity<OdontologoResponse> create(@Valid @RequestBody OdontologoRequest request) {
    var response = odontologoService.create(request);
    return ResponseEntity.status(HttpStatus.CREATED).body(response);
  }

  @PutMapping("/{id}")
  @PreAuthorize("hasRole('ADMINISTRADOR')")
  public OdontologoResponse update(@PathVariable UUID id, @Valid @RequestBody OdontologoRequest request) {
    return odontologoService.update(id, request);
  }

  @PatchMapping("/{id}/active")
  @PreAuthorize("hasRole('ADMINISTRADOR')")
  public ResponseEntity<Void> toggleActive(@PathVariable UUID id) {
    odontologoService.toggleActive(id);
    return ResponseEntity.noContent().build();
  }
}
