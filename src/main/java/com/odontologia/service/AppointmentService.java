package com.odontologia.service;

import com.odontologia.dto.AppointmentRequest;
import com.odontologia.dto.AppointmentResponse;
import com.odontologia.dto.AppointmentStatusRequest;
import com.odontologia.entity.Cita;
import com.odontologia.repository.AppointmentRepository;
import com.odontologia.entity.EstadoCita;
import com.odontologia.exception.BusinessException;
import com.odontologia.exception.ResourceNotFoundException;
import com.odontologia.repository.PatientRepository;
import com.odontologia.repository.StaffRepository;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class AppointmentService {

  private final AppointmentRepository appointmentRepository;
  private final PatientRepository patientRepository;
  private final StaffRepository staffRepository;

  public AppointmentService(AppointmentRepository appointmentRepository,
      PatientRepository patientRepository, StaffRepository staffRepository) {
    this.appointmentRepository = appointmentRepository;
    this.patientRepository = patientRepository;
    this.staffRepository = staffRepository;
  }

  public List<AppointmentResponse> findAll() {
    return appointmentRepository.findAll().stream()
        .map(AppointmentResponse::from)
        .toList();
  }

  public AppointmentResponse findById(UUID id) {
    return appointmentRepository.findById(id)
        .map(AppointmentResponse::from)
        .orElseThrow(() -> new ResourceNotFoundException("Appointment", id));
  }

  public List<AppointmentResponse> findByPatient(UUID patientId) {
    return appointmentRepository.findByPatientIdOrderByAppointmentDateDescStartTimeDesc(patientId)
        .stream()
        .map(AppointmentResponse::from)
        .toList();
  }

  @Transactional
  public AppointmentResponse create(AppointmentRequest request) {
    var patient = patientRepository.findById(request.patientId())
        .orElseThrow(() -> new ResourceNotFoundException("Patient", request.patientId()));
    var staff = staffRepository.findById(request.staffId())
        .orElseThrow(() -> new ResourceNotFoundException("Staff", request.staffId()));

    var appointment = new Cita();
    appointment.setPatient(patient);
    appointment.setStaff(staff);
    appointment.setAppointmentDate(request.appointmentDate());
    appointment.setStartTime(request.startTime());
    appointment.setEndTime(request.endTime());
    appointment.setType(request.type());
    appointment.setReason(request.reason());
    appointment.setNotes(request.notes());
    appointment.setStatus(EstadoCita.SCHEDULED);

    return AppointmentResponse.from(appointmentRepository.save(appointment));
  }

  @Transactional
  public AppointmentResponse update(UUID id, AppointmentRequest request) {
    var appointment = appointmentRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Appointment", id));
    var patient = patientRepository.findById(request.patientId())
        .orElseThrow(() -> new ResourceNotFoundException("Patient", request.patientId()));
    var staff = staffRepository.findById(request.staffId())
        .orElseThrow(() -> new ResourceNotFoundException("Staff", request.staffId()));

    appointment.setPatient(patient);
    appointment.setStaff(staff);
    appointment.setAppointmentDate(request.appointmentDate());
    appointment.setStartTime(request.startTime());
    appointment.setEndTime(request.endTime());
    appointment.setType(request.type());
    appointment.setReason(request.reason());
    appointment.setNotes(request.notes());

    return AppointmentResponse.from(appointmentRepository.save(appointment));
  }

  @Transactional
  public AppointmentResponse changeStatus(UUID id, AppointmentStatusRequest request) {
    var appointment = appointmentRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Appointment", id));
    validateStatusTransition(appointment.getStatus(), request.status());
    appointment.setStatus(request.status());
    return AppointmentResponse.from(appointmentRepository.save(appointment));
  }

  @Transactional
  public void cancel(UUID id) {
    var appointment = appointmentRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Appointment", id));
    appointment.setStatus(EstadoCita.CANCELLED);
    appointmentRepository.save(appointment);
  }

  private void validateStatusTransition(EstadoCita current, EstadoCita next) {
    if (current == EstadoCita.CANCELLED || current == EstadoCita.COMPLETED) {
      throw new BusinessException(
          "Cannot change status from " + current);
    }
    if (current == EstadoCita.SCHEDULED && next == EstadoCita.COMPLETED) {
      throw new BusinessException(
          "Cannot transition from SCHEDULED to COMPLETED directly");
    }
  }
}
