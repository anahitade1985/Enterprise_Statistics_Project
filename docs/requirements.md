# Anforderungsanalyse

## Ziel

Ziel des Systems ist die standardisierte und reproduzierbare Verarbeitung aggregierter Unternehmensdaten von Destatis.

Der Prozess soll Daten automatisiert einlesen, auf Qualität und Plausibilität prüfen, zentrale Kennzahlen berechnen und Ergebnisse strukturiert bereitstellen.

## Funktionale Anforderungen

### 1. Datenimport

- Das System muss Unternehmensdaten aus einer CSV-Datei einlesen können.
- Die ursprünglichen Rohdaten dürfen während der Verarbeitung nicht überschrieben werden.
- Die Verarbeitung muss reproduzierbar sein.

### 2. Datenqualität

Das System muss grundlegende Qualitätsprüfungen automatisch durchführen.

Dazu gehören:

- Erkennung fehlender beziehungsweise spezieller Werte
- Prüfung der Qualitätskennzeichen
- Erkennung von Dubletten
- Prüfung der strukturellen Vollständigkeit
- Prüfung der Datenformate

### 3. Datenaufbereitung

- Spezielle Werte müssen nach definierten Regeln verarbeitet werden.
- Zeitangaben und numerische Werte müssen in geeignete Datentypen überführt werden.
- Die Daten müssen für weitere Analyseschritte strukturiert vorbereitet werden.

### 4. Plausibilitätsprüfung

Das System muss auffällige Werte identifizieren können.

Dazu gehören beispielsweise:

- negative Werte
- außergewöhnlich starke Veränderungen gegenüber dem Vorjahr
- unerwartete Datenkonstellationen

Auffällige Werte dürfen nicht automatisch als Fehler behandelt werden.

Sie müssen zur weiteren fachlichen Prüfung markiert werden.

### 5. Kennzahlenanalyse

Das System soll zentrale Kennzahlen der Unternehmensstatistik berechnen können.

Beispiele:

- Umsatz
- Umsatzanteile
- Umsatzwachstum
- Umsatz je tätige Person
- Bruttolohn je Lohn- und Gehaltsempfänger
- Bruttowertschöpfung je tätige Person

### 6. Ergebnisbereitstellung

Die Ergebnisse sollen automatisch und nachvollziehbar bereitgestellt werden.

Dazu gehören:

- Tabellen
- Visualisierungen
- automatische textliche Zusammenfassungen

## Nichtfunktionale Anforderungen

### Nachvollziehbarkeit

Jeder Verarbeitungsschritt soll durch einen eigenen Programmschritt nachvollziehbar sein.

### Reproduzierbarkeit

Die gesamte Verarbeitung soll über eine zentrale Pipeline erneut ausgeführt werden können.

### Modularität

Import, Datenqualität, Aufbereitung, Plausibilisierung, Analyse, Visualisierung und Reporting sollen voneinander getrennt implementiert sein.

### Erweiterbarkeit

Neue Kennzahlen und Prüfregeln sollen später ergänzt werden können, ohne die gesamte Verarbeitung neu entwickeln zu müssen.

## Schnittstelle zwischen Statistik und IT

Fachliche statistische Regeln werden in technische Anforderungen und automatisierte Prüfungen übersetzt.

Beispiel:

Fachliche Regel:

> Eine starke Veränderung gegenüber dem Vorjahr kann statistisch auffällig sein.

Technische Umsetzung:

> Das System berechnet automatisch die jährliche Veränderungsrate und markiert Werte mit einer Veränderung von mehr als 30 Prozent zur weiteren Prüfung.

Die Kennzeichnung bedeutet nicht automatisch, dass ein Wert fehlerhaft ist. Die fachliche Bewertung erfolgt anhand weiterer Informationen und Metadaten.

## Abgrenzung

Die verwendeten Daten sind aggregierte Unternehmensstatistiken.

Das Projekt verarbeitet keine Einzelunternehmens- oder personenbezogenen Daten.