package com.odontologia.config;

import com.odontologia.security.StaffOAuth2User;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class AuditAwareImpl implements AuditorAware<UUID> {

  @Override
  public Optional<UUID> getCurrentAuditor() {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    if (auth == null || !auth.isAuthenticated()) {
      return Optional.empty();
    }
    Object principal = auth.getPrincipal();
    if (principal instanceof StaffOAuth2User oauth2User && oauth2User.getStaff() != null) {
      return Optional.of(oauth2User.getStaff().getId());
    }
    return Optional.empty();
  }
}
