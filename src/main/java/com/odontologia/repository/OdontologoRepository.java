package com.odontologia.repository;

import com.odontologia.entity.Odontologo;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OdontologoRepository extends JpaRepository<Odontologo, UUID> {
}
