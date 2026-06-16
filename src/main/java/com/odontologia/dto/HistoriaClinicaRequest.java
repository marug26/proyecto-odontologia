package com.odontologia.dto;

import jakarta.validation.constraints.NotNull;
import java.util.UUID;

public record HistoriaClinicaRequest(
    @NotNull UUID pacienteId,
    String observaciones
) {}
