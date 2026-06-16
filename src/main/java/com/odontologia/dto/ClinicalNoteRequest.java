package com.odontologia.dto;

public record ClinicalNoteRequest(
    String subjective,
    String objective,
    String assessment,
    String plan
) {}
