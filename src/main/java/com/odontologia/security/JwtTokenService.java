package com.odontologia.security;

import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.temporal.ChronoUnit;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.oauth2.jwt.JwtClaimsSet;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.JwtEncoderParameters;
import org.springframework.security.oauth2.jwt.NimbusJwtEncoder;
import org.springframework.stereotype.Service;

import com.nimbusds.jose.jwk.source.ImmutableSecret;
import com.nimbusds.jose.jwk.source.JWKSource;
import com.nimbusds.jose.proc.SecurityContext;
import com.odontologia.entity.Empleado;

@Service
public class JwtTokenService {

  private final JwtEncoder jwtEncoder;
  private final long expirationMinutes;

  public JwtTokenService(
      @Value("${app.jwt.secret}") String secret,
      @Value("${app.jwt.expiration-minutes:60}") long expirationMinutes) {
    this.expirationMinutes = expirationMinutes;
    SecretKey key = new SecretKeySpec(
        secret.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
    JWKSource<SecurityContext> source = new ImmutableSecret<>(key);
    this.jwtEncoder = new NimbusJwtEncoder(source);
  }

  public String generateToken(Empleado empleado) {
    Instant now = Instant.now();
    JwtClaimsSet claims = JwtClaimsSet.builder()
        .subject(empleado.getId().toString())
        .claim("email", empleado.getEmail())
        .claim("rol", empleado.getRol().name())
        .claim("nombre", empleado.getNombres() + " " + empleado.getApellidos())
        .issuedAt(now)
        .expiresAt(now.plus(expirationMinutes, ChronoUnit.MINUTES))
        .build();
    return jwtEncoder.encode(JwtEncoderParameters.from(claims)).getTokenValue();
  }
}
