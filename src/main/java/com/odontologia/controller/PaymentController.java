package com.odontologia.controller;
import com.odontologia.dto.PaymentRequest;
import com.odontologia.dto.PaymentResponse;

import com.odontologia.service.PaymentService;
import jakarta.validation.Valid;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class PaymentController {

  private final PaymentService paymentService;

  public PaymentController(PaymentService paymentService) {
    this.paymentService = paymentService;
  }

  @PostMapping("/invoices/{invoiceId}/payments")
  public ResponseEntity<PaymentResponse> register(@PathVariable UUID invoiceId,
      @Valid @RequestBody PaymentRequest request) {
    var response = paymentService.register(invoiceId, request);
    return ResponseEntity.status(HttpStatus.CREATED).body(response);
  }

  @GetMapping("/invoices/{invoiceId}/payments")
  public List<PaymentResponse> findByInvoice(@PathVariable UUID invoiceId) {
    return paymentService.findByInvoice(invoiceId);
  }

  @GetMapping("/patients/{patientId}/payments")
  public List<PaymentResponse> findByPatient(@PathVariable UUID patientId) {
    return paymentService.findByPatient(patientId);
  }
}
