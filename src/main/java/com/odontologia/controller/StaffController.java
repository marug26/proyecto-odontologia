package com.odontologia.controller;
import com.odontologia.dto.StaffRequest;
import com.odontologia.dto.StaffResponse;

import com.odontologia.security.AuthenticatedStaff;
import com.odontologia.service.StaffService;
import com.odontologia.entity.Staff;
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
@RequestMapping("/api/staff")
public class StaffController {

  private final StaffService staffService;

  public StaffController(StaffService staffService) {
    this.staffService = staffService;
  }

  @GetMapping
  @PreAuthorize("hasRole('ADMIN')")
  public List<StaffResponse> findAll() {
    return staffService.findAll();
  }

  @GetMapping("/me")
  public StaffResponse me(@AuthenticatedStaff Staff staff) {
    return staffService.findMe(staff.getId());
  }

  @GetMapping("/{id}")
  @PreAuthorize("hasRole('ADMIN')")
  public StaffResponse findById(@PathVariable UUID id) {
    return staffService.findById(id);
  }

  @PostMapping
  @PreAuthorize("hasRole('ADMIN')")
  public ResponseEntity<StaffResponse> create(@Valid @RequestBody StaffRequest request) {
    var response = staffService.create(request);
    return ResponseEntity.status(HttpStatus.CREATED).body(response);
  }

  @PutMapping("/{id}")
  @PreAuthorize("hasRole('ADMIN')")
  public StaffResponse update(@PathVariable UUID id, @Valid @RequestBody StaffRequest request) {
    return staffService.update(id, request);
  }

  @PatchMapping("/{id}/active")
  @PreAuthorize("hasRole('ADMIN')")
  public ResponseEntity<Void> toggleActive(@PathVariable UUID id) {
    staffService.toggleActive(id);
    return ResponseEntity.noContent().build();
  }
}
