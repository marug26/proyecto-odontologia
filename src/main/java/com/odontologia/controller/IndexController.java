package com.odontologia.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IndexController {

  @Value("${app.frontend.url:http://localhost:5173}")
  private String frontendUrl;

  @GetMapping("/")
  public ResponseEntity<Void> redirectToFrontend() {
    return ResponseEntity.status(HttpStatus.FOUND)
        .header(HttpHeaders.LOCATION, frontendUrl + "/login")
        .build();
  }
}
