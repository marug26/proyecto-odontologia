package com.odontologia.service;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.odontologia.dto.AppointmentRequest;
import com.odontologia.dto.AppointmentResponse;
import com.odontologia.dto.AppointmentStatusRequest;
import com.odontologia.entity.Cita;
import com.odontologia.entity.EstadoCita;
import com.odontologia.exception.BusinessException;
import com.odontologia.exception.ResourceNotFoundException;
import com.odontologia.repository.AppointmentRepository;
import com.odontologia.repository.OdontologoRepository;
import com.odontologia.repository.PatientRepository;

@Service
@Transactional(readOnly = true)
public class AppointmentService {

  private final AppointmentRepository appointmentRepository;
  private final PatientRepository patientRepository;
  private final OdontologoRepository odontologoRepository;

  public AppointmentService(AppointmentRepository appointmentRepository,
      PatientRepository patientRepository, OdontologoRepository odontologoRepository) {
    this.appointmentRepository = appointmentRepository;
    this.patientRepository = patientRepository;
    this.odontologoRepository = odontologoRepository;
  }

  public List<AppointmentResponse> findAll() {
    return appointmentRepository.findAll().stream()
        .map(AppointmentResponse::from)
        .toList();
  }

  public AppointmentResponse findById(UUID id) {
    return appointmentRepository.findById(id)
        .map(AppointmentResponse::from)
        .orElseThrow(() -> new ResourceNotFoundException("Cita", id));
  }

  public List<AppointmentResponse> findByPatient(UUID patientId) {
    return appointmentRepository.findByPacienteIdOrderByFechaCitaDescHoraCitaDesc(patientId)
        .stream()
        .map(AppointmentResponse::from)
        .toList();
  }

  @Transactional
  public AppointmentResponse create(AppointmentRequest request) {
    var paciente = patientRepository.findById(request.pacienteId())
        .orElseThrow(() -> new ResourceNotFoundException("Paciente", request.pacienteId()));
    var odontologo = odontologoRepository.findById(request.odontologoId())
        .orElseThrow(() -> new ResourceNotFoundException("Odontologo", request.odontologoId()));

    var cita = new Cita();
    cita.setPaciente(paciente);
    cita.setOdontologo(odontologo);
    cita.setFechaCita(request.fechaCita());
    cita.setHoraCita(request.horaCita());
    cita.setMotivoConsulta(request.motivoConsulta());
    cita.setEstadoCita(EstadoCita.PROGRAMADA);

    return AppointmentResponse.from(appointmentRepository.save(cita));
  }

  @Transactional
  public AppointmentResponse update(UUID id, AppointmentRequest request) {
    var cita = appointmentRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Cita", id));
    var paciente = patientRepository.findById(request.pacienteId())
        .orElseThrow(() -> new ResourceNotFoundException("Paciente", request.pacienteId()));
    var odontologo = odontologoRepository.findById(request.odontologoId())
        .orElseThrow(() -> new ResourceNotFoundException("Odontologo", request.odontologoId()));

    cita.setPaciente(paciente);
    cita.setOdontologo(odontologo);
    cita.setFechaCita(request.fechaCita());
    cita.setHoraCita(request.horaCita());
    cita.setMotivoConsulta(request.motivoConsulta());

    return AppointmentResponse.from(appointmentRepository.save(cita));
  }

  @Transactional
  public AppointmentResponse changeStatus(UUID id, AppointmentStatusRequest request) {
    var cita = appointmentRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Cita", id));
    validateStatusTransition(cita.getEstadoCita(), request.status());
    cita.setEstadoCita(request.status());
    return AppointmentResponse.from(appointmentRepository.save(cita));
  }

  @Transactional
  public void cancel(UUID id) {
    var cita = appointmentRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Cita", id));
    cita.setEstadoCita(EstadoCita.CANCELADA);
    appointmentRepository.save(cita);
  }

  private void validateStatusTransition(EstadoCita current, EstadoCita next) {
    if (current == EstadoCita.CANCELADA || current == EstadoCita.ATENDIDA) {
      throw new BusinessException(
          "Cannot change status from " + current);
    }
    if (current == EstadoCita.PROGRAMADA && next == EstadoCita.ATENDIDA) {
      throw new BusinessException(
          "Cannot transition from PROGRAMADA to ATENDIDA directly");
    }
  }
}
