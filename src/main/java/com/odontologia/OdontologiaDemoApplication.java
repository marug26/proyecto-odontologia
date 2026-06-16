package com.odontologia;

import com.odontologia.config.AuditAwareImpl;
import java.util.UUID;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class OdontologiaDemoApplication {

  public static void main(String[] args) {
    SpringApplication.run(OdontologiaDemoApplication.class, args);
  }

  @Bean
  public AuditorAware<UUID> auditorAware() {
    return new AuditAwareImpl();
  }
}
