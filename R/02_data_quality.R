# ==================================================
# 02 - DATENQUALITÄT
# ==================================================

# Finglish:
# Dar in marhale keyfiate data ro barrasi mikonim.

# Deutsch:
# In diesem Schritt prüfen wir die Datenqualität.


# Finglish:
# Tedade kole radifha ro namayesh midahim.

# Deutsch:
# Wir zeigen die Anzahl aller Zeilen an.

cat("Anzahl der Zeilen:", nrow(destatis_data), "\n")


# Finglish:
# Tedade sal-haye mokhtalef ro namayesh midahim.

# Deutsch:
# Wir zeigen die vorhandenen Jahre an.

cat(
  "Jahre:",
  min(as.numeric(destatis_data$time)),
  "bis",
  max(as.numeric(destatis_data$time)),
  "\n"
)


# Finglish:
# Frequency-e value_q ro barrasi mikonim.

# Deutsch:
# Wir prüfen die Häufigkeiten der Qualitätskennzeichen.

print(
  table(
    destatis_data$value_q,
    useNA = "ifany"
  )
)


# Finglish:
# Meghdarhaye gheire adadi dar sotune value ro پیدا mikonim.

# Deutsch:
# Wir identifizieren nichtnumerische Werte
# in der ursprünglichen Spalte "value".

special_values <- destatis_data[
  is.na(destatis_data$value_numeric),
  "value"
]

print(
  table(
    special_values,
    useNA = "ifany"
  )
)


# Finglish:
# Tedade "." ro mohasebe mikonim.

# Deutsch:
# Wir zählen die Werte mit ".".

dot_count <- sum(
  destatis_data$value == ".",
  na.rm = TRUE
)

cat("Anzahl '.' :", dot_count, "\n")


# Finglish:
# Tedade "-" ro mohasebe mikonim.

# Deutsch:
# Wir zählen die Werte mit "-".

dash_count <- sum(
  destatis_data$value == "-",
  na.rm = TRUE
)

cat("Anzahl '-' :", dash_count, "\n")


# Finglish:
# Duplicate-ha ro bar asase sal, andazeye sherkat
# va shakhes barrasi mikonim.

# Deutsch:
# Wir prüfen Dubletten anhand von Jahr,
# Unternehmensgröße und Kennzahl.

duplicate_check <- duplicated(
  destatis_data[
    ,
    c(
      "time",
      "X2_variable_attribute_label",
      "value_variable_label"
    )
  ]
)

cat(
  "Anzahl der Dubletten:",
  sum(duplicate_check),
  "\n"
)


# Finglish:
# Tedade combination-haye momken ro ba tedade vaghei moghayese mikonim.

# Deutsch:
# Wir vergleichen die erwartete Anzahl
# der Kombinationen mit der tatsächlichen Anzahl.

expected_combinations <- length(
  unique(destatis_data$time)
) *
  length(
    unique(destatis_data$X2_variable_attribute_label)
  ) *
  length(
    unique(destatis_data$value_variable_label)
  )

actual_rows <- nrow(destatis_data)

cat(
  "Erwartete Kombinationen:",
  expected_combinations,
  "\n"
)

cat(
  "Tatsächliche Zeilen:",
  actual_rows,
  "\n"
)


# Finglish:
# Agar tedade vaghei ba tedade entezar rafte barabar bashe,
# structure data kamel ast.

# Deutsch:
# Wenn beide Werte übereinstimmen,
# ist die strukturelle Kombination vollständig.

if (expected_combinations == actual_rows) {
  cat("Strukturelle Vollständigkeit: OK\n")
} else {
  cat("Strukturelle Vollständigkeit: Prüfen\n")
}