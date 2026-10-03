# ==================================================
# 05 - ANALYSE UND KENNZAHLEN
# ==================================================

# Finglish:
# Dar in marhale KPI-haye asli ro mohasebe mikonim.
# Nemudarha dar file جداگانه visualization ساخته mishan.

# Deutsch:
# In diesem Schritt berechnen wir die wichtigsten Kennzahlen.
# Die Visualisierungen werden später in einer separaten Datei erstellt.


# ==================================================
# 1. UMSATZ
# ==================================================

# Finglish:
# Dadehaye Umsatz ro entekhab mikonim.

# Deutsch:
# Wir wählen die Umsatzdaten aus.

umsatz_data <- prepared_data[
  prepared_data$value_variable_label == "Umsatz" &
    !is.na(prepared_data$value_numeric),
]


# Finglish:
# Umsatz-e Insgesamt ro جدا mikonim.

# Deutsch:
# Wir wählen den Gesamtumsatz aus.

umsatz_total <- umsatz_data[
  umsatz_data$X2_variable_attribute_label == "Insgesamt",
]


# Finglish:
# 4 andazeye asli sherkat ro جدا mikonim.

# Deutsch:
# Wir wählen die vier Unternehmensgrößen aus.

umsatz_sizes <- umsatz_data[
  umsatz_data$X2_variable_attribute_label != "Insgesamt",
]


# ==================================================
# 2. UMSATZANTEILE 2024
# ==================================================

# Finglish:
# Faghat Umsatz-e sal 2024 ro entekhab mikonim.

# Deutsch:
# Wir wählen nur die Umsatzwerte des Jahres 2024 aus.

umsatz_2024 <- umsatz_sizes[
  umsatz_sizes$time_num == 2024,
]


# Finglish:
# Majmooe Umsatz-e 4 group ro hesab mikonim.

# Deutsch:
# Wir berechnen den Gesamtumsatz der vier Unternehmensgrößen.

total_2024 <- sum(
  umsatz_2024$value_numeric,
  na.rm = TRUE
)


# Finglish:
# Sahme darsadi har group ro hesab mikonim.

# Deutsch:
# Wir berechnen den prozentualen Umsatzanteil jeder Unternehmensgröße.

umsatz_2024$share_percent <- (
  umsatz_2024$value_numeric / total_2024
) * 100


# ==================================================
# 3. UMSATZWACHSTUM 2008-2024
# ==================================================

# Finglish:
# Dadehaye 2008 va 2024 ro جدا mikonim.

# Deutsch:
# Wir wählen die Umsatzwerte für 2008 und 2024 aus.

umsatz_2008 <- umsatz_sizes[
  umsatz_sizes$time_num == 2008,
  c(
    "X2_variable_attribute_label",
    "value_numeric"
  )
]

umsatz_2024_growth <- umsatz_sizes[
  umsatz_sizes$time_num == 2024,
  c(
    "X2_variable_attribute_label",
    "value_numeric"
  )
]


# Finglish:
# Esme sotunha ro avaz mikonim.

# Deutsch:
# Wir benennen die Wertespalten eindeutig um.

names(umsatz_2008)[2] <- "value_2008"
names(umsatz_2024_growth)[2] <- "value_2024"


# Finglish:
# Do sal ro bar asase andazeye sherkat merge mikonim.

# Deutsch:
# Wir verbinden beide Jahre anhand der Unternehmensgröße.

umsatz_growth <- merge(
  umsatz_2008,
  umsatz_2024_growth,
  by = "X2_variable_attribute_label"
)


# Finglish:
# Darsade roshd Umsatz ro hesab mikonim.

# Deutsch:
# Wir berechnen das prozentuale Umsatzwachstum.

umsatz_growth$growth_percent <- (
  (
    umsatz_growth$value_2024 -
      umsatz_growth$value_2008
  ) /
    umsatz_growth$value_2008
) * 100


# ==================================================
# 4. UMSATZ JE TÄTIGE PERSON
# ==================================================

# Finglish:
# Shakhese Umsatz je taetige Person ro entekhab mikonim.

# Deutsch:
# Wir wählen die Kennzahl "Umsatz je tätige Person" aus.

umsatz_person_data <- prepared_data[
  prepared_data$value_variable_label == "Umsatz je tätige Person" &
    prepared_data$X2_variable_attribute_label != "Insgesamt" &
    !is.na(prepared_data$value_numeric),
]


# Finglish:
# Faghat sal 2024 ro جدا mikonim.

# Deutsch:
# Wir wählen die Werte für 2024 aus.

umsatz_person_2024 <- umsatz_person_data[
  umsatz_person_data$time_num == 2024,
]


# ==================================================
# 5. BRUTTOLOHN JE LOHN- UND GEHALTSEMPFÄNGER
# ==================================================

# Finglish:
# Dadehaye Bruttoloehne und -gehaelter ro جدا mikonim.

# Deutsch:
# Wir wählen die Bruttolöhne und -gehälter aus.

wages_data <- prepared_data[
  prepared_data$value_variable_label == "Bruttolöhne und -gehälter" &
    prepared_data$X2_variable_attribute_label != "Insgesamt" &
    !is.na(prepared_data$value_numeric),
]


# Finglish:
# Tedade Lohn- und Gehaltsempfaenger ro جدا mikonim.

# Deutsch:
# Wir wählen die Zahl der Lohn- und Gehaltsempfänger aus.

employees_data <- prepared_data[
  prepared_data$value_variable_label == "Lohn- und Gehaltsempfänger" &
    prepared_data$X2_variable_attribute_label != "Insgesamt" &
    !is.na(prepared_data$value_numeric),
]


# Finglish:
# Faghat sotunhaye lazem ro negah midarim.

# Deutsch:
# Wir behalten nur die benötigten Spalten.

wages_data_small <- wages_data[
  ,
  c(
    "time_num",
    "X2_variable_attribute_label",
    "value_numeric"
  )
]

employees_data_small <- employees_data[
  ,
  c(
    "time_num",
    "X2_variable_attribute_label",
    "value_numeric"
  )
]


# Finglish:
# Esme sotunha ro moshakhas mikonim.

# Deutsch:
# Wir benennen die Wertespalten eindeutig um.

names(wages_data_small)[3] <- "wages_total"
names(employees_data_small)[3] <- "employees_count"


# Finglish:
# Do dataset ro be ham vasl mikonim.

# Deutsch:
# Wir verbinden beide Datensätze.

salary_data <- merge(
  wages_data_small,
  employees_data_small,
  by = c(
    "time_num",
    "X2_variable_attribute_label"
  )
)


# Finglish:
# Bruttolohn taqribi be ezaye har hoghoogh-begir ro hesab mikonim.
# Bruttoloehne dar Mill. EUR ast,
# be hamin dalil dar 1,000,000 zarb mikonim.

# Deutsch:
# Wir berechnen den durchschnittlichen Bruttolohn
# je Lohn- und Gehaltsempfänger.
# Die Bruttolöhne werden von Millionen Euro in Euro umgerechnet.

salary_data$wage_per_employee <- (
  salary_data$wages_total * 1000000
) / salary_data$employees_count


# Finglish:
# Dadehaye sal 2024 ro جدا mikonim.

# Deutsch:
# Wir wählen die Werte für 2024 aus.

salary_2024 <- salary_data[
  salary_data$time_num == 2024,
]


# ==================================================
# 6. BRUTTOWERTSCHÖPFUNG JE TÄTIGE PERSON
# ==================================================

# Finglish:
# Esme daghigh shakhes ro az khode dataset پیدا mikonim.

# Deutsch:
# Wir suchen die genaue Bezeichnung der Kennzahl
# direkt im Datensatz.

value_labels <- unique(
  prepared_data$value_variable_label
)

value_added_metric <- value_labels[
  grepl(
    "Bruttowertsch",
    value_labels
  ) &
    grepl(
      "je tätige Person",
      value_labels
    )
]


# Finglish:
# Bayad faghat yek shakhes peyda beshe.

# Deutsch:
# Es muss genau eine passende Kennzahl gefunden werden.

if (length(value_added_metric) != 1) {
  stop(
    "Kennzahl 'Bruttowertschöpfung je tätige Person' konnte nicht eindeutig gefunden werden."
  )
}


# Finglish:
# Dadehaye in shakhes ro entekhab mikonim.

# Deutsch:
# Wir wählen die Daten dieser Kennzahl aus.

value_added_data <- prepared_data[
  prepared_data$value_variable_label == value_added_metric &
    prepared_data$X2_variable_attribute_label != "Insgesamt" &
    !is.na(prepared_data$value_numeric),
]


# Finglish:
# Faghat sal 2024 ro جدا mikonim.

# Deutsch:
# Wir wählen die Werte für 2024 aus.

value_added_2024 <- value_added_data[
  value_added_data$time_num == 2024,
]


# ==================================================
# 7. WACHSTUM DER BRUTTOWERTSCHÖPFUNG 2008-2024
# ==================================================

# Finglish:
# Dadehaye 2008 va 2024 ro entekhab mikonim.

# Deutsch:
# Wir wählen die Werte für 2008 und 2024 aus.

value_added_2008 <- value_added_data[
  value_added_data$time_num == 2008,
  c(
    "X2_variable_attribute_label",
    "value_numeric"
  )
]

value_added_2024_growth <- value_added_data[
  value_added_data$time_num == 2024,
  c(
    "X2_variable_attribute_label",
    "value_numeric"
  )
]


# Finglish:
# Esme sotunha ro avaz mikonim.

# Deutsch:
# Wir benennen die Wertespalten eindeutig um.

names(value_added_2008)[2] <- "value_2008"
names(value_added_2024_growth)[2] <- "value_2024"


# Finglish:
# Do dataset ro merge mikonim.

# Deutsch:
# Wir verbinden beide Datensätze.

value_added_growth <- merge(
  value_added_2008,
  value_added_2024_growth,
  by = "X2_variable_attribute_label"
)


# Finglish:
# Darsade roshd ro hesab mikonim.

# Deutsch:
# Wir berechnen die prozentuale Veränderung.

value_added_growth$growth_percent <- (
  (
    value_added_growth$value_2024 -
      value_added_growth$value_2008
  ) /
    value_added_growth$value_2008
) * 100


# ==================================================
# KONTROLLAUSGABE
# ==================================================

# Finglish:
# Natijehaye asli ro baraye check dar Console namayesh midahim.

# Deutsch:
# Wir geben die wichtigsten Ergebnisse
# zur Kontrolle in der Konsole aus.

cat("\n--- Umsatzanteile 2024 ---\n")
print(
  umsatz_2024[
    ,
    c(
      "X2_variable_attribute_label",
      "share_percent"
    )
  ]
)

cat("\n--- Umsatzwachstum 2008-2024 ---\n")
print(
  umsatz_growth[
    ,
    c(
      "X2_variable_attribute_label",
      "growth_percent"
    )
  ]
)

cat("\n--- Umsatz je tätige Person 2024 ---\n")
print(
  umsatz_person_2024[
    ,
    c(
      "X2_variable_attribute_label",
      "value_numeric",
      "value_unit"
    )
  ]
)

cat("\n--- Bruttolohn je Lohn- und Gehaltsempfänger 2024 ---\n")
print(
  salary_2024[
    ,
    c(
      "X2_variable_attribute_label",
      "wage_per_employee"
    )
  ]
)

cat("\n--- Bruttowertschöpfung je tätige Person 2024 ---\n")
print(
  value_added_2024[
    ,
    c(
      "X2_variable_attribute_label",
      "value_numeric",
      "value_unit"
    )
  ]
)

cat("\n--- Wachstum Bruttowertschöpfung 2008-2024 ---\n")
print(
  value_added_growth[
    ,
    c(
      "X2_variable_attribute_label",
      "growth_percent"
    )
  ]
)