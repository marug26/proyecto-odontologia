package com.odontologia.service;

import com.odontologia.exception.ResourceNotFoundException;
import com.odontologia.dto.StaffRequest;
import com.odontologia.dto.StaffResponse;
import com.odontologia.entity.Staff;
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
        .orElseThrow(() -> new ResourceNotFoundException("Staff", id));
  }

  public StaffResponse findMe(UUID id) {
    return findById(id);
  }

  @Transactional
  public StaffResponse create(StaffRequest request) {
    var staff = new Staff();
    staff.setName(request.name());
    staff.setEmail(request.email());
    staff.setRole(request.role());
    staff.setSpecialization(request.specialization());
    staff.setPhone(request.phone());
    staff.setActive(true);
    return StaffResponse.from(staffRepository.save(staff));
  }

  @Transactional
  public StaffResponse update(UUID id, StaffRequest request) {
    var staff = staffRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Staff", id));
    staff.setName(request.name());
    staff.setEmail(request.email());
    staff.setRole(request.role());
    staff.setSpecialization(request.specialization());
    staff.setPhone(request.phone());
    return StaffResponse.from(staffRepository.save(staff));
  }

  @Transactional
  public void toggleActive(UUID id) {
    var staff = staffRepository.findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Staff", id));
    staff.setActive(!staff.isActive());
    staffRepository.save(staff);
  }
}
