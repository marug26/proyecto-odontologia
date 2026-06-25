package com.odontologia;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Properties;
import java.util.UUID;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import com.odontologia.config.AuditAwareImpl;

@SpringBootApplication
@EnableJpaAuditing
public class OdontologiaDemoApplication {

  public static void main(String[] args) {

    Path envPath = Paths.get(System.getProperty("user.dir"), ".env");
    System.out.println("Looking for .env at: " + envPath.toAbsolutePath());
    System.out.println("File exists: " + Files.exists(envPath));

    if (Files.exists(envPath)) {
      try {
        Properties props = new Properties();
        try (InputStream is = Files.newInputStream(envPath)) {
          props.load(is);
        }
        props.forEach((key, value) -> System.setProperty(key.toString(), value.toString()));
        System.out.println("Loaded " + props.size() + " properties from .env");
      } catch (IOException e) {
        throw new RuntimeException("Failed to load .env file", e);
      }
    } else {
      System.err.println("WARNING: .env file not found at " + envPath.toAbsolutePath());
    }

    SpringApplication.run(OdontologiaDemoApplication.class, args);
  }

  @Bean
  public AuditorAware<UUID> auditorAware() {
    return new AuditAwareImpl();
  }
}
