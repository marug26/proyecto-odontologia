package com.odontologia.service;

import com.odontologia.dto.HistoriaClinicaRequest;
import com.odontologia.dto.HistoriaClinicaResponse;
import com.odontologia.entity.HistoriaClinica;
import com.odontologia.exception.ResourceNotFoundException;
import com.odontologia.repository.HistoriaClinicaRepository;
import com.odontologia.repository.PatientRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class HistoriaClinicaService {

  private final HistoriaClinicaRepository historiaClinicaRepository;
  private final PatientRepository patientRepository;

  public HistoriaClinicaService(HistoriaClinicaRepository historiaClinicaRepository,
      PatientRepository patientRepository) {
    this.historiaClinicaRepository = historiaClinicaRepository;
    this.patientRepository = patientRepository;
  }

  public HistoriaClinicaResponse findByPatientId(java.util.UUID pacienteId) {
    return historiaClinicaRepository.findByPacienteId(pacienteId)
        .map(HistoriaClinicaResponse::from)
        .orElseThrow(() -> new ResourceNotFoundException("HistoriaClinica", "pacienteId", pacienteId.toString()));
  }

  @Transactional
  public HistoriaClinicaResponse upsert(java.util.UUID pacienteId, HistoriaClinicaRequest request) {
    var paciente = patientRepository.findById(pacienteId)
        .orElseThrow(() -> new ResourceNotFoundException("Paciente", pacienteId));

    var historia = historiaClinicaRepository.findByPacienteId(pacienteId)
        .orElseGet(() -> {
          var nueva = new HistoriaClinica();
          nueva.setPaciente(paciente);
          return nueva;
        });

    historia.setObservaciones(request.observaciones());

    return HistoriaClinicaResponse.from(historiaClinicaRepository.save(historia));
  }
}
