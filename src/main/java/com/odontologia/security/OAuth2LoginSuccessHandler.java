package com.odontologia.security;

import com.odontologia.entity.Empleado;
import com.odontologia.repository.StaffRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {

  private final JwtTokenService jwtTokenService;
  private final StaffRepository staffRepository;
  private final String frontendUrl;

  public OAuth2LoginSuccessHandler(
      JwtTokenService jwtTokenService,
      StaffRepository staffRepository,
      @Value("${app.frontend.url:http://localhost:5173}") String frontendUrl) {
    this.jwtTokenService = jwtTokenService;
    this.staffRepository = staffRepository;
    this.frontendUrl = frontendUrl;
  }

  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
      Authentication authentication) throws IOException, ServletException {
    OAuth2AuthenticationToken oauthToken = (OAuth2AuthenticationToken) authentication;
    Empleado empleado = resolveEmpleado(oauthToken);

    String token = jwtTokenService.generateToken(empleado);

    jakarta.servlet.http.HttpSession session = request.getSession(false);
    if (session != null) {
      session.invalidate();
    }

    response.sendRedirect(frontendUrl + "/auth/callback#token=" + token);
  }

  private Empleado resolveEmpleado(OAuth2AuthenticationToken oauthToken) {
    Object principal = oauthToken.getPrincipal();

    if (principal instanceof StaffOAuth2User staffUser) {
      return staffUser.getEmpleado();
    }

    if (principal instanceof OidcUser oidcUser) {
      String email = oidcUser.getEmail();
      String sub = oidcUser.getSubject();
      return staffRepository.findByGoogleSub(sub)
          .or(() -> staffRepository.findByEmail(email))
          .orElseThrow(() -> new RuntimeException(
              "Access denied: no staff account found for email " + email));
    }

    throw new RuntimeException("Unsupported principal type: " + principal.getClass().getName());
  }
}
