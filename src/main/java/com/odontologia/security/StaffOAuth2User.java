package com.odontologia.security;

import com.odontologia.entity.Empleado;
import java.util.Collection;
import java.util.Map;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

@Getter
public class StaffOAuth2User implements OAuth2User {

  private final Empleado empleado;
  private final OAuth2User delegate;

  public StaffOAuth2User(Empleado empleado, OAuth2User delegate) {
    this.empleado = empleado;
    this.delegate = delegate;
  }

  @Override
  public Map<String, Object> getAttributes() {
    return delegate.getAttributes();
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return empleado.getAuthorities();
  }

  @Override
  public String getName() {
    return delegate.getName();
  }
}
