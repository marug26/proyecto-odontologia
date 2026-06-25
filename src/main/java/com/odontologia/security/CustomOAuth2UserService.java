package com.odontologia.security;

import com.odontologia.entity.Empleado;
import com.odontologia.repository.StaffRepository;
import java.util.List;
import org.springframework.core.convert.converter.Converter;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.stereotype.Service;

@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

  private final StaffRepository staffRepository;
  private final DefaultOAuth2UserService delegate = new DefaultOAuth2UserService();

  public CustomOAuth2UserService(StaffRepository staffRepository) {
    this.staffRepository = staffRepository;
  }

  @Override
  public OAuth2User loadUser(OAuth2UserRequest userRequest) {
    OAuth2User oauth2User = delegate.loadUser(userRequest);
    String email = oauth2User.getAttribute("email");
    String googleSub = oauth2User.getAttribute("sub");

    Empleado empleado = staffRepository.findByGoogleSub(googleSub)
        .or(() -> staffRepository.findByEmail(email))
        .orElseThrow(() -> new RuntimeException(
            "Access denied: no staff account found for email " + email));

    if (empleado.getGoogleSub() == null) {
      empleado.setGoogleSub(googleSub);
      staffRepository.save(empleado);
    }

    return new StaffOAuth2User(empleado, oauth2User);
  }

  public Converter<Jwt, AbstractAuthenticationToken> jwtConverter() {
    return jwt -> {
      String email = jwt.getClaim("email");
      Empleado empleado = staffRepository.findByEmail(email).orElse(null);
      if (empleado == null) {
        return null;
      }
      List<GrantedAuthority> authorities = List.of(
          new SimpleGrantedAuthority("ROLE_" + empleado.getRol().name()));
      return new JwtAuthenticationToken(jwt, authorities, empleado.getNombres());
    };
  }
}
