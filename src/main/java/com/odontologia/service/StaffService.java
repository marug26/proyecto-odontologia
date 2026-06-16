package com.odontologia.service;

import com.odontologia.exception.ResourceNotFoundException;
import com.odontologia.dto.StaffRequest;
import com.odontologia.dto.StaffResponse;
import com.odontologia.entity.Empleado;
import com.odontologia.repository.StaffRepository;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class StaffService {

  private final StaffRepository staffRepository;

  public StaffService(StaffRepository staffRepository) {
    this.staffRepository = staffRepository;
  }

  public List<StaffResponse> findAll() {
    return staffRepository.findAll().stream()
        .map(StaffResponse::from)
        .toList();
  }

  public StaffResponse findById(UUID id) {
    return staffRepository.findById(id)
        .map(StaffResponse::from)
        .orElseThrow(() -> new ResourceNotFoundException("Empleado", id));
  }

  public StaffResponse findMe(UUID id) {
    return findById(id);
  }

  @Transactional
  public StaffResponse create(StaffRequest request) {
    var empleado = new Empleado();
    empleado.setNombres(request.nombres());
    empleado.setApellidos(request.apellidos());
    empleado.setEmail(request.email());
    empleado.setRol(request.rol());
    empleado.setIdentificacion(request.identificacion());
    empleado.setActive(true);
    return StaffResponse.from(staffRepository.save(empleado));
  }

  @Transactional
  public StaffResponse update(UUID id, StaffRequest request) {
    var empleado = staffRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Empleado", id));
    empleado.setNombres(request.nombres());
    empleado.setApellidos(request.apellidos());
    empleado.setEmail(request.email());
    empleado.setRol(request.rol());
    empleado.setIdentificacion(request.identificacion());
    return StaffResponse.from(staffRepository.save(empleado));
  }

  @Transactional
  public void toggleActive(UUID id) {
    var empleado = staffRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Empleado", id));
    empleado.setActive(!empleado.isActive());
    staffRepository.save(empleado);
  }
}
