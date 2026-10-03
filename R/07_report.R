# ==================================================
# 07 - AUTOMATISCHER ANALYSEBERICHT
# ==================================================

# Finglish:
# Dar in marhale az natijehaye mohasebe shode
# yek gozaresh matni khodkar misazim.

# Deutsch:
# In diesem Schritt erstellen wir automatisch
# einen textlichen Analysebericht aus den berechneten Ergebnissen.


# Finglish:
# Group ba bishtarin Umsatzanteil dar 2024 ro پیدا mikonim.

# Deutsch:
# Wir bestimmen die Unternehmensgröße
# mit dem höchsten Umsatzanteil im Jahr 2024.

max_share_row <- umsatz_2024[
  which.max(umsatz_2024$share_percent),
]


# Finglish:
# Group ba bishtarin Umsatzwachstum ro پیدا mikonim.

# Deutsch:
# Wir bestimmen die Unternehmensgröße
# mit dem stärksten Umsatzwachstum.

max_umsatz_growth_row <- umsatz_growth[
  which.max(umsatz_growth$growth_percent),
]


# Finglish:
# Group ba bishtarin Umsatz je taetige Person dar 2024 ro پیدا mikonim.

# Deutsch:
# Wir bestimmen die Unternehmensgröße
# mit dem höchsten Umsatz je tätige Person im Jahr 2024.

max_umsatz_person_row <- umsatz_person_2024[
  which.max(umsatz_person_2024$value_numeric),
]


# Finglish:
# Group ba bishtarin Bruttolohn dar 2024 ro پیدا mikonim.

# Deutsch:
# Wir bestimmen die Unternehmensgröße
# mit dem höchsten berechneten Bruttolohn im Jahr 2024.

max_salary_row <- salary_2024[
  which.max(salary_2024$wage_per_employee),
]


# Finglish:
# Group ba bishtarin Bruttowertschoepfung dar 2024 ro پیدا mikonim.

# Deutsch:
# Wir bestimmen die Unternehmensgröße
# mit der höchsten Bruttowertschöpfung je tätige Person im Jahr 2024.

max_value_added_row <- value_added_2024[
  which.max(value_added_2024$value_numeric),
]


# Finglish:
# Group ba bishtarin roshde Bruttowertschoepfung ro پیدا mikonim.

# Deutsch:
# Wir bestimmen die Unternehmensgröße
# mit dem stärksten Wachstum der Bruttowertschöpfung je tätige Person.

max_value_added_growth_row <- value_added_growth[
  which.max(value_added_growth$growth_percent),
]


# Finglish:
# Matn gozaresh ro line be line misazim.

# Deutsch:
# Wir erstellen den Bericht zeilenweise.

report_lines <- c(

  "AUTOMATISCHER ANALYSEBERICHT",
  "============================",
  "",

  paste0(
    "1. Umsatzanteil 2024: ",
    max_share_row$X2_variable_attribute_label,
    " weist mit ",
    format(
      round(max_share_row$share_percent, 1),
      decimal.mark = ","
    ),
    " % den höchsten Anteil am Gesamtumsatz auf."
  ),

  "",

  paste0(
    "2. Umsatzwachstum 2008-2024: ",
    max_umsatz_growth_row$X2_variable_attribute_label,
    " zeigt mit ",
    format(
      round(max_umsatz_growth_row$growth_percent, 1),
      decimal.mark = ","
    ),
    " % das stärkste relative Umsatzwachstum."
  ),

  "",

  paste0(
    "3. Umsatz je tätige Person 2024: ",
    max_umsatz_person_row$X2_variable_attribute_label,
    " erreicht mit ",
    format(
      round(max_umsatz_person_row$value_numeric, 0),
      big.mark = ".",
      decimal.mark = ",",
      scientific = FALSE
    ),
    " den höchsten Wert."
  ),

  "",

  paste0(
    "4. Bruttolohn je Lohn- und Gehaltsempfänger 2024: ",
    max_salary_row$X2_variable_attribute_label,
    " weist mit rund ",
    format(
      round(max_salary_row$wage_per_employee, 0),
      big.mark = ".",
      decimal.mark = ",",
      scientific = FALSE
    ),
    " Euro den höchsten berechneten Wert auf."
  ),

  "",

  paste0(
    "5. Bruttowertschöpfung je tätige Person 2024: ",
    max_value_added_row$X2_variable_attribute_label,
    " weist mit ",
    format(
      round(max_value_added_row$value_numeric, 0),
      big.mark = ".",
      decimal.mark = ",",
      scientific = FALSE
    ),
    " den höchsten Wert auf."
  ),

  "",

  paste0(
    "6. Wachstum der Bruttowertschöpfung 2008-2024: ",
    max_value_added_growth_row$X2_variable_attribute_label,
    " zeigt mit ",
    format(
      round(max_value_added_growth_row$growth_percent, 1),
      decimal.mark = ","
    ),
    " % das stärkste relative Wachstum."
  ),

  "",

  "Hinweis:",
  "Auffällige Veränderungen sollten nicht automatisch als Fehler bewertet werden.",
  "Für eine fachliche Bewertung sind zusätzlich Metadaten und methodische Hinweise zu berücksichtigen."
)


# Finglish:
# Agar output folder vojood nadashte bashe,
# khodkar an ro misazim.

# Deutsch:
# Falls der Ausgabeordner noch nicht existiert,
# wird er automatisch erstellt.

dir.create(
  "output",
  showWarnings = FALSE
)


# Finglish:
# Gozaresh ro dar yek file txt ذخیره mikonim.

# Deutsch:
# Wir speichern den Bericht als Textdatei.

writeLines(
  report_lines,
  "output/analysis_summary.txt",
  useBytes = TRUE
)


# Finglish:
# Haman gozaresh ro dar Console ham namayesh midahim.

# Deutsch:
# Wir zeigen denselben Bericht zusätzlich in der Konsole an.

cat(
  paste(report_lines, collapse = "\n"),
  "\n"
)


# Finglish:
# Payame nahaei.

# Deutsch:
# Abschließende Kontrollmeldung.

cat(
  "\nAutomatischer Analysebericht wurde unter output/analysis_summary.txt gespeichert.\n"
)