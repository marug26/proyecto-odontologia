package com.odontologia.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;

import com.odontologia.security.CustomOAuth2UserService;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

  private final CustomOAuth2UserService oauth2UserService;

  public SecurityConfig(CustomOAuth2UserService oauth2UserService) {
    this.oauth2UserService = oauth2UserService;
  }

  @Bean
  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    return http
        .csrf(csrf -> csrf.disable())
        .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED))
        .authorizeHttpRequests(auth -> auth
            .requestMatchers("/api-docs/**", "/swagger-ui/**", "/swagger-ui.html", "/v3/api-docs/**").permitAll()
            .requestMatchers(HttpMethod.GET, "/api/procedures").permitAll()
            .anyRequest().authenticated()
        )
        .oauth2Login(oauth2 -> oauth2
            .userInfoEndpoint(userInfo -> userInfo.userService(oauth2UserService))
        )
        .oauth2ResourceServer(resource -> resource
            .jwt(jwt -> jwt.jwtAuthenticationConverter(oauth2UserService.jwtConverter()))
        )
        .build();
  }

  // @Override
  // public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

  //   OAuth2user oauthUser = super.loadUser(userRequest);
  //   // Aquí puedes realizar cualquier lógica adicional con el usuario autenticado, como asignar roles o permisos personalizados.
  //   System.out.println("Usuario autenticado: " + oauthUser.getName());
  //   System.out.println("Atributos del usuario: " + oauthUser.getAttributes());

  //   return oauthUser;
  // }
}
