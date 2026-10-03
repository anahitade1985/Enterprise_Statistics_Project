# ==================================================
# 03 - DATENAUFBEREITUNG
# ==================================================

# Finglish:
# Dar in marhale dadeha ro baraye تحلیل آماده mikonim.

# Deutsch:
# In diesem Schritt bereiten wir die Daten
# für die weitere Analyse vor.


# Finglish:
# Haman sotune value_numeric ro check mikonim
# ta مطمئن beshim baraye تحلیل mojude.

# Deutsch:
# Wir prüfen, ob die numerische Wertespalte
# für die Analyse vorhanden ist.

if (!"value_numeric" %in% names(destatis_data)) {
  stop("Die Spalte 'value_numeric' fehlt.")
}


# Finglish:
# Sal ro be numeric tabdil mikonim
# ta baraye sort va mohasebat zamani estefade بشه.

# Deutsch:
# Wir wandeln das Jahr in einen numerischen Wert um,
# damit zeitliche Sortierungen und Berechnungen möglich sind.

destatis_data$time_num <- as.numeric(
  destatis_data$time
)


# Finglish:
# Dadeha ro bar asase sal, andazeye sherkat
# va shakhes مرتب mikonim.

# Deutsch:
# Wir sortieren die Daten nach Jahr,
# Unternehmensgröße und Kennzahl.

prepared_data <- destatis_data[
  order(
    destatis_data$time_num,
    destatis_data$X2_variable_attribute_label,
    destatis_data$value_variable_label
  ),
]


# Finglish:
# Faghat sotunhaye mohem ro check mikonim.

# Deutsch:
# Wir prüfen einige zentrale Spalten.

print(
  head(
    prepared_data[
      ,
      c(
        "time_num",
        "X2_variable_attribute_label",
        "value_variable_label",
        "value",
        "value_numeric",
        "value_unit",
        "value_q"
      )
    ],
    10
  )
)


# Finglish:
# Tedade radifhaye آماده shode ro namayesh midahim.

# Deutsch:
# Wir zeigen die Anzahl der aufbereiteten Zeilen an.

cat(
  "Aufbereitete Zeilen:",
  nrow(prepared_data),
  "\n"
)


# Finglish:
# Check mikonim ke tedade radifha az bein narafte باشه.

# Deutsch:
# Wir prüfen, ob bei der Aufbereitung
# keine Zeilen verloren gegangen sind.

if (nrow(prepared_data) == nrow(destatis_data)) {
  cat("Datenaufbereitung: OK\n")
} else {
  cat("Datenaufbereitung: Prüfen\n")
}