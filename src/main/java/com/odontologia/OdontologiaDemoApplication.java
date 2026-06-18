package com.odontologia;

import java.util.UUID;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import com.odontologia.config.AuditAwareImpl;

import io.github.cdimascio.dotenv.Dotenv;

@SpringBootApplication
@EnableJpaAuditing
public class OdontologiaDemoApplication {

  public static void main(String[] args) {

    Dotenv dotenv = Dotenv.load();
    
    System.setProperty("GOOGLE_CLIENT_ID", dotenv.get("GOOGLE_CLIENT_ID"));
    System.setProperty("GOOGLE_CLIENT_SECRET", dotenv.get("GOOGLE_CLIENT_SECRET"));

    SpringApplication.run(OdontologiaDemoApplication.class, args);
  }

  @Bean
  public AuditorAware<UUID> auditorAware() {
    return new AuditAwareImpl();
  }
}
