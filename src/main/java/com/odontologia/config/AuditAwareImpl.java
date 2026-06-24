package com.odontologia.config;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;

import com.odontologia.security.StaffOAuth2User;


public class AuditAwareImpl implements AuditorAware<UUID> {

  @Override
  public Optional<UUID> getCurrentAuditor() {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    if (auth == null || !auth.isAuthenticated()) {
      return Optional.empty();
    }
    Object principal = auth.getPrincipal();
    if (principal instanceof StaffOAuth2User oauth2User && oauth2User.getEmpleado() != null) {
      return Optional.of(oauth2User.getEmpleado().getId());
    }
    if (principal instanceof Jwt jwt) {
      String sub = jwt.getSubject();
      if (sub != null) {
        return Optional.of(UUID.fromString(sub));
      }
    }
    return Optional.empty();
  }
}
