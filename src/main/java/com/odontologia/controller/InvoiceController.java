package com.odontologia.controller;
import com.odontologia.dto.InvoiceRequest;
import com.odontologia.dto.InvoiceResponse;

import com.odontologia.service.InvoiceService;
import jakarta.validation.Valid;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class InvoiceController {

  private final InvoiceService invoiceService;

  public InvoiceController(InvoiceService invoiceService) {
    this.invoiceService = invoiceService;
  }

  @PostMapping("/patients/{patientId}/invoices")
  public ResponseEntity<InvoiceResponse> create(@PathVariable UUID patientId,
      @Valid @RequestBody InvoiceRequest request) {
    var actualRequest = new InvoiceRequest(
        patientId, request.issueDate(), request.dueDate(),
        request.discount(), request.notes(), request.items()
    );
    var response = invoiceService.create(actualRequest);
    return ResponseEntity.status(HttpStatus.CREATED).body(response);
  }

  @GetMapping("/invoices/{id}")
  public InvoiceResponse findById(@PathVariable UUID id) {
    return invoiceService.findById(id);
  }

  @GetMapping("/patients/{patientId}/invoices")
  public List<InvoiceResponse> findByPatient(@PathVariable UUID patientId) {
    return invoiceService.findByPatient(patientId);
  }

  @PatchMapping("/invoices/{id}/cancel")
  public ResponseEntity<Void> cancel(@PathVariable UUID id) {
    invoiceService.cancel(id);
    return ResponseEntity.noContent().build();
  }
}
