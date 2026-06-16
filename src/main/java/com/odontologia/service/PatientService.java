package com.odontologia.service;

import com.odontologia.exception.ResourceNotFoundException;
import com.odontologia.dto.PatientRequest;
import com.odontologia.dto.PatientResponse;
import com.odontologia.entity.Paciente;
import com.odontologia.repository.PatientRepository;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class PatientService {

  private final PatientRepository patientRepository;

  public PatientService(PatientRepository patientRepository) {
    this.patientRepository = patientRepository;
  }

  public List<PatientResponse> findAll() {
    return patientRepository.findAll().stream()
        .map(PatientResponse::from)
        .toList();
  }

  public PatientResponse findById(UUID id) {
    return patientRepository.findById(id)
        .map(PatientResponse::from)
        .orElseThrow(() -> new ResourceNotFoundException("Paciente", id));
  }

  public List<PatientResponse> searchByName(String name) {
    return patientRepository.findByNombresContainingIgnoreCase(name).stream()
        .map(PatientResponse::from)
        .toList();
  }

  @Transactional
  public PatientResponse create(PatientRequest request) {
    var paciente = new Paciente();
    apply(request, paciente);
    return PatientResponse.from(patientRepository.save(paciente));
  }

  @Transactional
  public PatientResponse update(UUID id, PatientRequest request) {
    var paciente = patientRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Paciente", id));
    apply(request, paciente);
    return PatientResponse.from(patientRepository.save(paciente));
  }

  @Transactional
  public void delete(UUID id) {
    patientRepository.deleteById(id);
  }

  private void apply(PatientRequest r, Paciente p) {
    p.setNombres(r.nombres());
    p.setApellidos(r.apellidos());
    p.setEmail(r.email());
    p.setTelefono(r.telefono());
    p.setFechaNacimiento(r.fechaNacimiento());
    p.setDireccion(r.direccion());
    p.setTipoPaciente(r.tipoPaciente());
    p.setIdentificacion(r.identificacion());
  }
}
