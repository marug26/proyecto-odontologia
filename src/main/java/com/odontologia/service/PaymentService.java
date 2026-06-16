package com.odontologia.service;

import com.odontologia.dto.PaymentRequest;
import com.odontologia.dto.PaymentResponse;
import com.odontologia.entity.Invoice;
import com.odontologia.repository.InvoiceRepository;
import com.odontologia.entity.EstadoFactura;
import com.odontologia.entity.Payment;
import com.odontologia.repository.PaymentRepository;
import com.odontologia.exception.ResourceNotFoundException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class PaymentService {

  private final PaymentRepository paymentRepository;
  private final InvoiceRepository invoiceRepository;

  public PaymentService(PaymentRepository paymentRepository,
      InvoiceRepository invoiceRepository) {
    this.paymentRepository = paymentRepository;
    this.invoiceRepository = invoiceRepository;
  }

  public List<PaymentResponse> findByInvoice(UUID invoiceId) {
    return paymentRepository.findByInvoiceId(invoiceId).stream()
        .map(PaymentResponse::from)
        .toList();
  }

  public List<PaymentResponse> findByPatient(UUID patientId) {
    return invoiceRepository.findByPatientIdOrderByIssueDateDesc(patientId).stream()
        .flatMap(inv -> paymentRepository.findByInvoiceId(inv.getId()).stream())
        .map(PaymentResponse::from)
        .toList();
  }

  @Transactional
  public PaymentResponse register(UUID invoiceId, PaymentRequest request) {
    var invoice = invoiceRepository.findById(invoiceId)
        .orElseThrow(() -> new ResourceNotFoundException("Invoice", invoiceId));

    var payment = new Payment();
    payment.setInvoice(invoice);
    payment.setAmount(request.amount());
    payment.setPaymentMethod(request.paymentMethod());
    payment.setPaymentDate(request.paymentDate() != null ? request.paymentDate() : LocalDate.now());
    payment.setReference(request.reference());
    payment.setNotes(request.notes());

    paymentRepository.save(payment);

    updateInvoicePaidAmount(invoice);

    return PaymentResponse.from(payment);
  }

  private void updateInvoicePaidAmount(Invoice invoice) {
    BigDecimal paid = paymentRepository.findByInvoiceId(invoice.getId()).stream()
        .map(Payment::getAmount)
        .reduce(BigDecimal.ZERO, BigDecimal::add);
    invoice.setPaidAmount(paid);

    int comparison = paid.compareTo(invoice.getTotal());
    if (comparison >= 0) {
      invoice.setStatus(EstadoFactura.PAID);
    } else if (paid.compareTo(BigDecimal.ZERO) > 0) {
      invoice.setStatus(EstadoFactura.PARTIALLY_PAID);
    }
    invoiceRepository.save(invoice);
  }
}
