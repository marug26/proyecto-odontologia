package com.odontologia.service;

import com.odontologia.dto.OdontologoRequest;
import com.odontologia.dto.OdontologoResponse;
import com.odontologia.entity.Odontologo;
import com.odontologia.entity.RolEmpleado;
import com.odontologia.exception.ResourceNotFoundException;
import com.odontologia.repository.OdontologoRepository;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class OdontologoService {

  private final OdontologoRepository odontologoRepository;

  public OdontologoService(OdontologoRepository odontologoRepository) {
    this.odontologoRepository = odontologoRepository;
  }

  public List<OdontologoResponse> findAll() {
    return odontologoRepository.findAll().stream()
        .map(OdontologoResponse::from)
        .toList();
  }

  public OdontologoResponse findById(UUID id) {
    return odontologoRepository.findById(id)
        .map(OdontologoResponse::from)
        .orElseThrow(() -> new ResourceNotFoundException("Odontologo", id));
  }

  @Transactional
  public OdontologoResponse create(OdontologoRequest request) {
    var odontologo = new Odontologo();
    apply(request, odontologo);
    odontologo.setRol(RolEmpleado.ODONTOLOGO);
    odontologo.setActive(true);
    return OdontologoResponse.from(odontologoRepository.save(odontologo));
  }

  @Transactional
  public OdontologoResponse update(UUID id, OdontologoRequest request) {
    var odontologo = odontologoRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Odontologo", id));
    apply(request, odontologo);
    return OdontologoResponse.from(odontologoRepository.save(odontologo));
  }

  @Transactional
  public void toggleActive(UUID id) {
    var odontologo = odontologoRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Odontologo", id));
    odontologo.setActive(!odontologo.isActive());
    odontologoRepository.save(odontologo);
  }

  private void apply(OdontologoRequest r, Odontologo o) {
    o.setNombres(r.nombres());
    o.setApellidos(r.apellidos());
    o.setEmail(r.email());
    o.setIdentificacion(r.identificacion());
    o.setRegistroProfesional(r.registroProfesional());
    o.setEspecialidad(r.especialidad());
  }
}
