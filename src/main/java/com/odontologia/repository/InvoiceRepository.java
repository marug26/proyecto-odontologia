package com.odontologia.repository;

import com.odontologia.entity.Invoice;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InvoiceRepository extends JpaRepository<Invoice, UUID> {

  List<Invoice> findByPatientIdOrderByIssueDateDesc(UUID patientId);

  Optional<Invoice> findByInvoiceNumber(String invoiceNumber);
}
