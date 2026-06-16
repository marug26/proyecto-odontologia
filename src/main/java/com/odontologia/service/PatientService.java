package com.odontologia.service;

import com.odontologia.exception.ResourceNotFoundException;
import com.odontologia.dto.PatientRequest;
import com.odontologia.dto.PatientResponse;
import com.odontologia.service.OdontogramValidator;
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
  private final OdontogramValidator odontogramValidator;

  public PatientService(PatientRepository patientRepository,
      OdontogramValidator odontogramValidator) {
    this.patientRepository = patientRepository;
    this.odontogramValidator = odontogramValidator;
  }

  public List<PatientResponse> findAll() {
    return patientRepository.findByActiveTrueAndNameContainingIgnoreCase("").stream()
        .map(PatientResponse::from)
        .toList();
  }

  public PatientResponse findById(UUID id) {
    return patientRepository.findById(id)
        .map(PatientResponse::from)
        .orElseThrow(() -> new ResourceNotFoundException("Patient", id));
  }

  @Transactional
  public PatientResponse create(PatientRequest request) {
    odontogramValidator.validate(request.odontogram());
    var patient = new Paciente();
    apply(request, patient);
    return PatientResponse.from(patientRepository.save(patient));
  }

  @Transactional
  public PatientResponse update(UUID id, PatientRequest request) {
    odontogramValidator.validate(request.odontogram());
    var patient = patientRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Patient", id));
    apply(request, patient);
    return PatientResponse.from(patientRepository.save(patient));
  }

  @Transactional
  public void delete(UUID id) {
    var patient = patientRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Patient", id));
    patient.setActive(false);
    patientRepository.save(patient);
  }

  private void apply(PatientRequest r, Paciente p) {
    p.setName(r.name());
    p.setEmail(r.email());
    p.setPhone(r.phone());
    p.setBirthDate(r.birthDate());
    p.setGender(r.gender());
    p.setCpf(r.cpf());
    p.setAddressStreet(r.addressStreet());
    p.setAddressNumber(r.addressNumber());
    p.setAddressComplement(r.addressComplement());
    p.setAddressNeighborhood(r.addressNeighborhood());
    p.setAddressCity(r.addressCity());
    p.setAddressState(r.addressState());
    p.setAddressZip(r.addressZip());
    p.setEmergencyContactName(r.emergencyContactName());
    p.setEmergencyContactPhone(r.emergencyContactPhone());
    p.setResponsiblePerson(r.responsiblePerson());
    p.setMedicalHistory(r.medicalHistory() != null ? r.medicalHistory() : "{}");
    p.setMedications(r.medications());
    p.setAllergies(r.allergies());
    p.setOdontogram(r.odontogram() != null ? r.odontogram() : "{}");
    p.setNotes(r.notes());
    p.setActive(true);
  }
}
