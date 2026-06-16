package com.odontologia.security;

import com.odontologia.entity.Staff;
import java.util.Collection;
import java.util.Map;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

@Getter
public class StaffOAuth2User implements OAuth2User {

  private final Staff staff;
  private final OAuth2User delegate;

  public StaffOAuth2User(Staff staff, OAuth2User delegate) {
    this.staff = staff;
    this.delegate = delegate;
  }

  @Override
  public Map<String, Object> getAttributes() {
    return delegate.getAttributes();
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return staff.getAuthorities();
  }

  @Override
  public String getName() {
    return delegate.getName();
  }
}
