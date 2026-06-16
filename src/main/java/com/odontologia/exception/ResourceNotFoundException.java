package com.odontologia.exception;

import java.util.UUID;

public class ResourceNotFoundException extends RuntimeException {

  public ResourceNotFoundException(String resource, UUID id) {
    super("%s with id %s not found".formatted(resource, id));
  }

  public ResourceNotFoundException(String resource, String field, String value) {
    super("%s with %s '%s' not found".formatted(resource, field, value));
  }
}
