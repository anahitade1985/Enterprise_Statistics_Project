# ==================================================
# 01 - DATENIMPORT UND GRUNDVORBEREITUNG
# ==================================================

# Finglish:
# Dadehaye Destatis ro az file CSV وارد mikonim.

# Deutsch:
# Wir importieren die Destatis-Daten aus der CSV-Datei.

destatis_data <- read.csv2(
  "data/48121-0001_de_flat.csv",
  fileEncoding = "UTF-8-BOM",
  stringsAsFactors = FALSE
)


# Finglish:
# Yek copy az sotune value misazim.
# "." ro NA va "-" ro 0 mikonim.

# Deutsch:
# Wir erstellen eine Kopie der Spalte "value".
# "." wird zu NA und "-" wird zu 0.

value_clean <- destatis_data$value

value_clean[value_clean == "."] <- NA
value_clean[value_clean == "-"] <- "0"


# Finglish:
# Meghdarha ro be numeric tabdil mikonim.

# Deutsch:
# Wir wandeln die Werte in numerische Werte um.

destatis_data$value_numeric <- as.numeric(
  value_clean
)


# Finglish:
# Chand radife aval ro baraye check namayesh midahim.

# Deutsch:
# Wir zeigen einige Zeilen zur Kontrolle an.

head(destatis_data)