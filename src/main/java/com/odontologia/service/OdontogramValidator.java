package com.odontologia.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.odontologia.exception.BusinessException;
import java.time.LocalDate;
import java.util.Map;
import java.util.Set;
import org.springframework.stereotype.Component;

@Component
public class OdontogramValidator {

  private static final Set<String> VALID_STATUSES = Set.of(
      "HEALTHY", "CARIES", "FILLED", "ROOT_CANAL", "CROWN",
      "BRIDGE", "IMPLANT", "MISSING", "EXTRACTION_INDICATED",
      "TREATED", "FRACTURED", "WEAR", "NOT_ERUPTED"
  );

  private static final ObjectMapper mapper = new ObjectMapper();

  public void validate(String json) {
    if (json == null || json.isBlank()) {
      return;
    }
    try {
      Map<String, Object> root = mapper.readValue(json, new TypeReference<>() {});
      @SuppressWarnings("unchecked")
      Map<String, Object> teeth = (Map<String, Object>) root.get("teeth");
      if (teeth == null) {
        return;
      }
      for (Map.Entry<String, Object> entry : teeth.entrySet()) {
        String toothKey = entry.getKey();
        validateToothNumber(toothKey);
        @SuppressWarnings("unchecked")
        Map<String, Object> toothData = (Map<String, Object>) entry.getValue();
        if (toothData != null) {
          String status = (String) toothData.get("status");
          if (status != null && !VALID_STATUSES.contains(status)) {
            throw new BusinessException(
                "Invalid tooth status '%s' for tooth %s".formatted(status, toothKey));
          }
        }
      }
    } catch (BusinessException e) {
      throw e;
    } catch (Exception e) {
      throw new BusinessException("Invalid odontogram JSON structure");
    }
  }

  private void validateToothNumber(String toothNumber) {
    try {
      int n = Integer.parseInt(toothNumber);
      if (n < 11 || n > 85 || (n % 10) > 8 || (n % 10) < 1) {
        throw new BusinessException("Invalid tooth number: " + toothNumber);
      }
    } catch (NumberFormatException e) {
      throw new BusinessException("Invalid tooth number format: " + toothNumber);
    }
  }
}
