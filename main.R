# ==================================================
# MAIN PIPELINE
# ==================================================

# Finglish:
# Hame marhalehaye proje ro be tartib اجرا mikonim.

# Deutsch:
# Wir führen alle Verarbeitungsschritte
# in einer festen Reihenfolge aus.

source("R/01_import.R")
source("R/02_data_quality.R")
source("R/03_preparation.R")
source("R/04_plausibility.R")
source("R/05_analysis.R")
source("R/06_visualization.R")
source("R/07_report.R")


# Finglish:
# Payame nahaei baraye motevafegh boodane ejraye system.

# Deutsch:
# Abschließende Meldung bei erfolgreicher Ausführung.

cat("\nPipeline erfolgreich abgeschlossen.\n")