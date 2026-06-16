package com.odontologia.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.odontologia.entity.FacturaDetalle;

public interface InvoiceItemRepository extends JpaRepository<FacturaDetalle, UUID> {

  List<FacturaDetalle> findByInvoiceId(UUID invoiceId);
}
