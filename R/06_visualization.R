# ==================================================
# 06 - VISUALISIERUNG
# ==================================================

# Finglish:
# Dar in file faghat nemudarhaye nahaei va mohem ro misazim.
# Har nemudar mostaghiman dar output/charts ذخیره mishe.

# Deutsch:
# In dieser Datei erstellen wir nur die wichtigsten
# und finalen Visualisierungen.
# Jede Grafik wird direkt im Ordner output/charts gespeichert.


# Finglish:
# Ranghaye sabet baraye andazehaye sherkat.

# Deutsch:
# Feste Farben für die Unternehmensgrößen.

size_colors <- c(
  "Kleinstunternehmen" = "blue",
  "Kleine Unternehmen" = "darkgreen",
  "Mittlere Unternehmen" = "orange",
  "Großunternehmen" = "red"
)


# ==================================================
# 1. UMSATZWACHSTUM 2008-2024
# ==================================================

# Finglish:
# Dadeha ro bar asase roshd مرتب mikonim.

# Deutsch:
# Wir sortieren die Daten nach der Wachstumsrate.

plot_data <- umsatz_growth[
  order(umsatz_growth$growth_percent),
]

plot_colors <- size_colors[
  plot_data$X2_variable_attribute_label
]


# Finglish:
# File PNG baraye nemudar misazim.

# Deutsch:
# Wir öffnen eine PNG-Datei für die Grafik.
# Finglish:
# Agar پوشه output/charts vojood nadashte bashe,
# khodkar an ro misazim.

# Deutsch:
# Falls der Ordner output/charts noch nicht existiert,
# wird er automatisch erstellt.

dir.create(
  "output/charts",
  recursive = TRUE,
  showWarnings = FALSE
)
png(
  "output/charts/01_umsatzwachstum_2008_2024.png",
  width = 1200,
  height = 750,
  res = 120
)

par(
  mar = c(5, 12, 4, 4)
)

bar_pos <- barplot(
  plot_data$growth_percent,
  names.arg = plot_data$X2_variable_attribute_label,
  horiz = TRUE,
  col = plot_colors,
  border = NA,
  las = 1,
  xlim = c(
    0,
    max(plot_data$growth_percent) * 1.30
  ),
  xlab = "Umsatzwachstum 2008-2024 (%)",
  main = "Umsatzwachstum nach Unternehmensgröße"
)

text(
  x = plot_data$growth_percent,
  y = bar_pos,
  labels = paste0(
    round(plot_data$growth_percent, 1),
    " %"
  ),
  pos = 4
)

dev.off()


# ==================================================
# 2. UMSATZ JE TÄTIGE PERSON 2024
# ==================================================

# Finglish:
# Dadehaye sal 2024 ro bar asase meghdar مرتب mikonim.

# Deutsch:
# Wir sortieren die Werte für 2024 nach ihrer Höhe.

plot_data <- umsatz_person_2024[
  order(umsatz_person_2024$value_numeric),
]

plot_colors <- size_colors[
  plot_data$X2_variable_attribute_label
]

png(
  "output/charts/02_umsatz_je_taetige_person_2024.png",
  width = 1200,
  height = 750,
  res = 120
)

par(
  mar = c(5, 12, 4, 4)
)

bar_pos <- barplot(
  plot_data$value_numeric,
  names.arg = plot_data$X2_variable_attribute_label,
  horiz = TRUE,
  col = plot_colors,
  border = NA,
  las = 1,
  xlim = c(
    0,
    max(plot_data$value_numeric) * 1.25
  ),
  xlab = "Umsatz je tätige Person",
  main = "Umsatz je tätige Person im Jahr 2024"
)

text(
  x = plot_data$value_numeric,
  y = bar_pos,
  labels = format(
    round(plot_data$value_numeric, 0),
    big.mark = ".",
    decimal.mark = ",",
    scientific = FALSE
  ),
  pos = 4
)

dev.off()


# ==================================================
# 3. BRUTTOLOHN JE LOHN- UND GEHALTSEMPFÄNGER 2024
# ==================================================

# Finglish:
# Dadehaye hoghoogh ro bar asase meghdar مرتب mikonim.

# Deutsch:
# Wir sortieren die berechneten Bruttolohnwerte.

plot_data <- salary_2024[
  order(salary_2024$wage_per_employee),
]

plot_colors <- size_colors[
  plot_data$X2_variable_attribute_label
]

png(
  "output/charts/03_bruttolohn_je_empfaenger_2024.png",
  width = 1200,
  height = 750,
  res = 120
)

par(
  mar = c(5, 12, 4, 4)
)

bar_pos <- barplot(
  plot_data$wage_per_employee,
  names.arg = plot_data$X2_variable_attribute_label,
  horiz = TRUE,
  col = plot_colors,
  border = NA,
  las = 1,
  xlim = c(
    0,
    max(plot_data$wage_per_employee) * 1.25
  ),
  xlab = "Euro je Lohn- und Gehaltsempfänger",
  main = "Bruttolohn je Lohn- und Gehaltsempfänger 2024"
)

text(
  x = plot_data$wage_per_employee,
  y = bar_pos,
  labels = paste0(
    format(
      round(plot_data$wage_per_employee, 0),
      big.mark = ".",
      decimal.mark = ","
    ),
    " €"
  ),
  pos = 4
)

dev.off()


# ==================================================
# 4. BRUTTOWERTSCHÖPFUNG JE TÄTIGE PERSON 2024
# ==================================================

# Finglish:
# Dadehaye Bruttowertschoepfung ro مرتب mikonim.

# Deutsch:
# Wir sortieren die Bruttowertschöpfungswerte.

plot_data <- value_added_2024[
  order(value_added_2024$value_numeric),
]

plot_colors <- size_colors[
  plot_data$X2_variable_attribute_label
]

png(
  "output/charts/04_bruttowertschoepfung_2024.png",
  width = 1200,
  height = 750,
  res = 120
)

par(
  mar = c(5, 12, 4, 4)
)

bar_pos <- barplot(
  plot_data$value_numeric,
  names.arg = plot_data$X2_variable_attribute_label,
  horiz = TRUE,
  col = plot_colors,
  border = NA,
  las = 1,
  xlim = c(
    0,
    max(plot_data$value_numeric) * 1.25
  ),
  xlab = "Bruttowertschöpfung je tätige Person",
  main = "Bruttowertschöpfung je tätige Person 2024"
)

text(
  x = plot_data$value_numeric,
  y = bar_pos,
  labels = format(
    round(plot_data$value_numeric, 0),
    big.mark = ".",
    decimal.mark = ",",
    scientific = FALSE
  ),
  pos = 4
)

dev.off()


# ==================================================
# 5. WACHSTUM DER BRUTTOWERTSCHÖPFUNG 2008-2024
# ==================================================

# Finglish:
# Dadeha ro bar asase darsade roshd مرتب mikonim.

# Deutsch:
# Wir sortieren die Daten nach dem Wachstum.

plot_data <- value_added_growth[
  order(value_added_growth$growth_percent),
]

plot_colors <- size_colors[
  plot_data$X2_variable_attribute_label
]

png(
  "output/charts/05_wachstum_bruttowertschoepfung.png",
  width = 1200,
  height = 750,
  res = 120
)

par(
  mar = c(5, 12, 4, 4)
)

bar_pos <- barplot(
  plot_data$growth_percent,
  names.arg = plot_data$X2_variable_attribute_label,
  horiz = TRUE,
  col = plot_colors,
  border = NA,
  las = 1,
  xlim = c(
    0,
    max(plot_data$growth_percent) * 1.30
  ),
  xlab = "Wachstum 2008-2024 (%)",
  main = "Wachstum der Bruttowertschöpfung je tätige Person"
)

text(
  x = plot_data$growth_percent,
  y = bar_pos,
  labels = paste0(
    round(plot_data$growth_percent, 1),
    " %"
  ),
  pos = 4
)

dev.off()


# ==================================================
# 6. ZEITREIHE DER BRUTTOWERTSCHÖPFUNG
# ==================================================

# Finglish:
# Akharin nemudar, ronde zamani بهره‌وری ro
# baraye 4 group neshun mide.

# Deutsch:
# Die letzte Grafik zeigt die zeitliche Entwicklung
# der Bruttowertschöpfung je tätige Person
# für die vier Unternehmensgrößen.

png(
  "output/charts/06_trend_bruttowertschoepfung.png",
  width = 1200,
  height = 750,
  res = 120
)

par(
  mar = c(6, 7, 5, 3)
)

y_ticks <- pretty(
  value_added_data$value_numeric
)

plot(
  NULL,
  xlim = range(value_added_data$time_num),
  ylim = range(value_added_data$value_numeric),
  xaxt = "n",
  yaxt = "n",
  xlab = "Jahr",
  ylab = "Bruttowertschöpfung je tätige Person",
  main = "Entwicklung der Bruttowertschöpfung\nje tätige Person"
)

abline(
  h = y_ticks,
  col = "gray90",
  lty = 3
)

axis(
  1,
  at = sort(unique(value_added_data$time_num)),
  labels = sort(unique(value_added_data$time_num)),
  cex.axis = 0.8
)

axis(
  2,
  at = y_ticks,
  labels = format(
    y_ticks,
    big.mark = ".",
    decimal.mark = ",",
    scientific = FALSE
  ),
  las = 1
)

for (company in names(size_colors)) {

  company_data <- value_added_data[
    value_added_data$X2_variable_attribute_label == company,
  ]

  lines(
    company_data$time_num,
    company_data$value_numeric,
    type = "o",
    col = size_colors[company],
    pch = 16,
    lwd = 2
  )
}

legend(
  "topleft",
  legend = names(size_colors),
  col = size_colors,
  lty = 1,
  lwd = 2,
  pch = 16,
  bty = "n",
  cex = 0.8
)

dev.off()


# Finglish:
# Payame nahaei baraye check.

# Deutsch:
# Abschließende Kontrollmeldung.

cat(
  "Visualisierungen wurden unter output/charts gespeichert.\n"
)