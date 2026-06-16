package com.odontologia.service;

import com.odontologia.dto.InvoiceRequest;
import com.odontologia.dto.InvoiceResponse;
import com.odontologia.entity.Invoice;
import com.odontologia.entity.InvoiceItem;
import com.odontologia.repository.InvoiceItemRepository;
import com.odontologia.repository.InvoiceRepository;
import com.odontologia.entity.EstadoFactura;
import com.odontologia.exception.BusinessException;
import com.odontologia.exception.ResourceNotFoundException;
import com.odontologia.repository.PatientRepository;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class InvoiceService {

  private final InvoiceRepository invoiceRepository;
  private final InvoiceItemRepository invoiceItemRepository;
  private final PatientRepository patientRepository;

  public InvoiceService(InvoiceRepository invoiceRepository,
      InvoiceItemRepository invoiceItemRepository, PatientRepository patientRepository) {
    this.invoiceRepository = invoiceRepository;
    this.invoiceItemRepository = invoiceItemRepository;
    this.patientRepository = patientRepository;
  }

  public InvoiceResponse findById(UUID id) {
    return invoiceRepository.findById(id)
        .map(InvoiceResponse::from)
        .orElseThrow(() -> new ResourceNotFoundException("Invoice", id));
  }

  public List<InvoiceResponse> findByPatient(UUID patientId) {
    return invoiceRepository.findByPatientIdOrderByIssueDateDesc(patientId).stream()
        .map(InvoiceResponse::from)
        .toList();
  }

  @Transactional
  public InvoiceResponse create(InvoiceRequest request) {
    var patient = patientRepository.findById(request.patientId())
        .orElseThrow(() -> new ResourceNotFoundException("Patient", request.patientId()));

    var invoice = new Invoice();
    invoice.setPatient(patient);
    invoice.setInvoiceNumber(generateInvoiceNumber());
    invoice.setIssueDate(request.issueDate() != null ? request.issueDate() : LocalDate.now());
    invoice.setDueDate(request.dueDate());
    invoice.setDiscount(request.discount() != null ? request.discount() : BigDecimal.ZERO);
    invoice.setNotes(request.notes());
    invoice.setStatus(EstadoFactura.PENDING);

    BigDecimal subtotal = BigDecimal.ZERO;
    if (request.items() != null) {
      for (var itemReq : request.items()) {
        var itemTotal = itemReq.unitPrice().multiply(BigDecimal.valueOf(itemReq.quantity()));
        subtotal = subtotal.add(itemTotal);

        var item = new InvoiceItem();
        item.setInvoice(invoice);
        item.setDescription(itemReq.description());
        item.setQuantity(itemReq.quantity());
        item.setUnitPrice(itemReq.unitPrice());
        item.setTotal(itemTotal);
        invoiceItemRepository.save(item);
      }
    }

    invoice.setSubtotal(subtotal);
    invoice.setTotal(subtotal.subtract(invoice.getDiscount()));
    invoice.setPaidAmount(BigDecimal.ZERO);

    return InvoiceResponse.from(invoiceRepository.save(invoice));
  }

  @Transactional
  public void cancel(UUID id) {
    var invoice = invoiceRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Invoice", id));
    if (invoice.getStatus() == EstadoFactura.PAID) {
      throw new BusinessException("Cannot cancel a paid invoice");
    }
    invoice.setStatus(EstadoFactura.CANCELLED);
    invoiceRepository.save(invoice);
  }

  private String generateInvoiceNumber() {
    int year = LocalDate.now().getYear();
    long count = invoiceRepository.count() + 1;
    return "FAC-%d-%06d".formatted(year, count);
  }
}
