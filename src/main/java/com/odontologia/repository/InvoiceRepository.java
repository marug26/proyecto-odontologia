package com.odontologia.repository;

import com.odontologia.entity.Factura;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InvoiceRepository extends JpaRepository<Factura, UUID> {

  List<Factura> findByPatientIdOrderByIssueDateDesc(UUID patientId);

  Optional<Factura> findByInvoiceNumber(String invoiceNumber);
}
