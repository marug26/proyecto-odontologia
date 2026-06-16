package com.odontologia.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.odontologia.dto.InvoiceRequest;
import com.odontologia.dto.InvoiceResponse;
import com.odontologia.entity.EstadoFactura;
import com.odontologia.entity.Factura;
import com.odontologia.entity.FacturaDetalle;
import com.odontologia.exception.BusinessException;
import com.odontologia.exception.ResourceNotFoundException;
import com.odontologia.repository.InvoiceItemRepository;
import com.odontologia.repository.InvoiceRepository;
import com.odontologia.repository.PatientRepository;

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
        .orElseThrow(() -> new ResourceNotFoundException("Factura", id));
  }

  public List<InvoiceResponse> findByPatient(UUID patientId) {
    return invoiceRepository.findByPacienteFacturadoIdOrderByFechaEmisionDesc(patientId).stream()
        .map(InvoiceResponse::from)
        .toList();
  }

  @Transactional
  public InvoiceResponse create(InvoiceRequest request) {
    var paciente = patientRepository.findById(request.pacienteId())
        .orElseThrow(() -> new ResourceNotFoundException("Paciente", request.pacienteId()));

    var factura = new Factura();
    factura.setPacienteFacturado(paciente);
    factura.setNumeroFactura(generateInvoiceNumber());
    factura.setFechaEmision(request.fechaEmision());
    factura.setMetodoDePago(null);
    factura.setEstadoFactura(EstadoFactura.PENDIENTE);

    BigDecimal total = BigDecimal.ZERO;

      for (var itemReq : request.items()) {
        var itemTotal = itemReq.valorUnitario().multiply(BigDecimal.valueOf(itemReq.cantidad()));
        total = total.add(itemTotal);

        var item = new FacturaDetalle();
        item.setFactura(factura);
        item.setDescripcion(itemReq.descripcion());
        item.setCantidad(itemReq.cantidad());
        item.setValorUnitario(itemReq.valorUnitario());
        item.setTotal(itemTotal);
        invoiceItemRepository.save(item);
      }

    factura.setTotal(total);

    return InvoiceResponse.from(invoiceRepository.save(factura));
  }

  @Transactional
  public void cancel(UUID id) {
    var factura = invoiceRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Factura", id));
    if (factura.getEstadoFactura() == EstadoFactura.PAGADO) {
      throw new BusinessException("No se puede cancelar una factura pagada");
    }
    factura.setEstadoFactura(EstadoFactura.CANCELADO);
    invoiceRepository.save(factura);
  }

  private String generateInvoiceNumber() {
    int year = LocalDate.now().getYear();
    long count = invoiceRepository.count() + 1;
    return "FAC-%d-%06d".formatted(year, count);
  }
}
