# ==================================================
# 04 - PLAUSIBILITÄTSPRÜFUNG
# ==================================================

# Finglish:
# Dar in marhale dadeha ro az nazare mantiqi va آماری barrasi mikonim.

# Deutsch:
# In diesem Schritt prüfen wir die Daten
# auf auffällige und möglicherweise unplausible Werte.


# Finglish:
# Aval meghdarhaye manfi ro پیدا mikonim.

# Deutsch:
# Zunächst identifizieren wir negative Werte.

negative_values <- prepared_data[
  !is.na(prepared_data$value_numeric) &
    prepared_data$value_numeric < 0,
]


# Finglish:
# Tedade meghdarhaye manfi ro namayesh midahim.

# Deutsch:
# Wir zeigen die Anzahl negativer Werte an.

cat(
  "Anzahl negativer Werte:",
  nrow(negative_values),
  "\n"
)


# Finglish:
# Agar meghdare manfi vojood dasht,
# chand radif ro baraye barrasi namayesh midahim.

# Deutsch:
# Falls negative Werte vorhanden sind,
# zeigen wir einige Zeilen zur Prüfung an.

if (nrow(negative_values) > 0) {
  print(
    negative_values[
      ,
      c(
        "time_num",
        "X2_variable_attribute_label",
        "value_variable_label",
        "value_numeric",
        "value_unit"
      )
    ]
  )
}


# Finglish:
# Hala faghat shakhes Umsatz ro baraye
# taghirat sal be sal barrasi mikonim.

# Deutsch:
# Nun prüfen wir die Kennzahl "Umsatz"
# auf auffällige Veränderungen gegenüber dem Vorjahr.

umsatz_check <- prepared_data[
  prepared_data$value_variable_label == "Umsatz" &
    prepared_data$X2_variable_attribute_label != "Insgesamt" &
    !is.na(prepared_data$value_numeric),
]


# Finglish:
# Dadeha ro bar asase group va sal مرتب mikonim.

# Deutsch:
# Wir sortieren die Daten
# nach Unternehmensgröße und Jahr.

umsatz_check <- umsatz_check[
  order(
    umsatz_check$X2_variable_attribute_label,
    umsatz_check$time_num
  ),
]


# Finglish:
# Sotune taghire darsadi sal be sal misazim.

# Deutsch:
# Wir erstellen eine Spalte
# für die prozentuale Veränderung zum Vorjahr.

umsatz_check$yoy_change_percent <- NA_real_


# Finglish:
# Baraye har group جداگانه taghirat sal be sal ro hesab mikonim.

# Deutsch:
# Für jede Unternehmensgröße
# berechnen wir die Veränderung zum Vorjahr separat.

for (company in unique(umsatz_check$X2_variable_attribute_label)) {

  idx <- which(
    umsatz_check$X2_variable_attribute_label == company
  )

  values <- umsatz_check$value_numeric[idx]

  yoy <- c(
    NA,
    diff(values) / head(values, -1) * 100
  )

  umsatz_check$yoy_change_percent[idx] <- yoy
}


# Finglish:
# Taghirat bishtar az 30 darsad ro
# be onvane auffaellig mark mikonim.
# Auffaellig yani niaz be barrasi دارد,
# na inke hatman eshtebah باشه.

# Deutsch:
# Veränderungen von mehr als 30 Prozent
# werden als auffällig markiert.
# "Auffällig" bedeutet prüfenswert,
# nicht automatisch fehlerhaft.

auffaellige_umsatzwerte <- umsatz_check[
  !is.na(umsatz_check$yoy_change_percent) &
    abs(umsatz_check$yoy_change_percent) > 30,
]


# Finglish:
# Tedade موارد auffaellig ro namayesh midahim.

# Deutsch:
# Wir zeigen die Anzahl auffälliger Veränderungen an.

cat(
  "Auffällige Umsatzveränderungen > 30 %:",
  nrow(auffaellige_umsatzwerte),
  "\n"
)


# Finglish:
# Radifhaye auffaellig ro dar Console namayesh midahim.

# Deutsch:
# Wir zeigen die auffälligen Fälle
# in der Konsole an.

print(
  auffaellige_umsatzwerte[
    ,
    c(
      "time_num",
      "X2_variable_attribute_label",
      "value_numeric",
      "yoy_change_percent"
    )
  ]
)