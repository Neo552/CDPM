---
title: "CDPM Toolkit"
subtitle: "Checklisten & Vorlagen"
description: "Praktische Checklisten, Vorlagen und Leitfäden für die Einführung und Umsetzung von Context Driven Project Management (CDPM)"
toc: true
---

# Checklisten & Vorlagen - Toolkit

## Kick-off-Checkliste (Pilot):

- Sponsor/PRO benannt, RACI bestätigt

- Zielmetriken & Baseline-0-Datum fixiert

- Kontext-Vorlage gewählt/angepasst

- Destillationskanäle eingerichtet (Alias, Tags)

- Rituale terminiert (Daily/Weekly/Bi-Weekly)

- Freigabeschwellen und Audit-Trail festgelegt

## Definition of Done - Destillat:

- Effekt explizit (Zeit/Budget/Scope/Ziel)

- Quellen/Belege verlinkt

- Betroffene Kontextelemente referenziert

- Commit-Metadaten gesetzt (Wer/Wann/Warum)

## Vorlage - Minimaler Kontext (JSON-Schema, vereinfacht):

```json
{
  "Goals": [],
  "Scope": {},
  "Timeline": {"milestones": []},
  "Budget": {"total": 0, "items": []},
  "Risks": [],
  "Dependencies": [],
  "SuccessCriteria": [],
  "ActionItems": [],
  "CommitLog": []
}
```

# Einführung & Pilotprojekte

Dieses Kapitel beschreibt, wie Context Driven Project Management (CDPM)
pragmatisch eingeführt und in einem Pilotvorhaben validiert wird. Ziel
ist ein schneller, messbarer Nutzen ohne Big-Bang-Transformation. CDPM
ergänzt bestehende Arbeitsweisen und macht sie kontextfähig,
versionierbar und KI-nutzbar.

## Zielbild des Einstiegs

Leitgedanke: Kontext vor Artefakt. Der Pilot beweist, dass eine führende
Projektwahrheit (SSOT) mit Destillation, Analyse und Guidance im
Kreislauf operativ trägt und messbar bessere Entscheidungen ermöglicht.

### Ergebnisse des Piloten (Definition of Success):

- Eine lebendige SSOT (Kontext) mit Basiskomponenten, ersten Action
  Items und Commit-Historie ist in Betrieb.

- Rolling-Forecast, Risiko- und Statusprojektionen entstehen
  automatisiert/halbautomatisiert aus dem Kontext.

- Die Delta-Latenz (Roh-Update → Kontext-Commit) sinkt signifikant;
  Forecast-Stabilität steigt.

- Stakeholder können über eine KI-Schnittstelle (z.B. Chat) eigenständig „Was-wäre-wenn"-Szenarien durchspielen. Das Ergebnis der Simulation dient als dynamische Entscheidungsgrundlage, ohne den Kontext direkt zu verändern.

- Quick-Wins sind sichtbar: z. B. halbierter Reporting-Aufwand,
  reduzierte Überraschungen am Meilenstein.

## Pilot-Blueprint

**Empfohlener Umfang:** 6-10 Wochen, ein Projekt mittlerer Komplexität
(klarer Scope, echte Abhängigkeiten, externe Signale). Kein „Moonshot",
aber auch nicht trivial.

### Team & Rollen

- **PRO - Project Owner (Guardian):** Verantwortlich für Destillation,
  Gültigkeit, Commit-Formalia, Baselines. Keine inhaltliche
  Entscheidungsgewalt.

- **Stakeholder/Delivery Leads:** Treffen **fachliche** Trade-offs &
  geben Effekte (Zeit/Budget/Scope/Ziele) frei; liefern Updates & setzen
  AIs um.

- **Sponsorship/Management:** Stellt Rahmen & Transparenz sicher,
  moderiert Eskalationen; **keine** Inhaltsentscheidungen
  stellvertretend.

- **KI-Assistenz/Agenten:** Context/Analysis/Guidance/Update/Reporting;
  read → propose → justify; **keine Auto-Commits**.

### Governance

- **RACI:** R=PRO (Form/Gültigkeit), **A=zuständige
  Stakeholder** (fachliche Entscheidungen), C=Expert:innen,
  I=Organisation via Reports.

- **Freigaberegel:** **Kein Kontext-Commit ohne
  PRO-Freigabe** der **Form/Gültigkeit** **und** dokumentierte **fachliche
  Abnahme** (Quelle oder benannter Stakeholder).

- **Kleindelta-Batches:** Schwellen (z. B. ≤ 5 AT/≤ 10 k) können
  gesammelt committed werden, wenn Quelle/Betroffene gelistet sind.

### Tooling (minimal, mapping-arm)

- **Kontext-Repository** (Dok/OneNote/DB/Repo mit Versionierung
  der **Commits/Merges**).

- **Konnektoren light** zu E-Mail/Kalender/Ticketing (nur Ingest).

- **Sichten** (Roadmap/Gantt, Status, Risiko, Finanz) als **thin
  artefacts** aus dem Kontext.

- **KI optional:** Destillationsvorschläge, Vollständigkeitscheck,
  Szenarien.

### Daten & Sicherheit

- Zugriff für **alle Stakeholder + KI** gemäß Rolle; Shadow-Tools nur
  für Roh-Updates.

- Protokollierung von Quellen/Commits (Audit Trail); Pseudonymisierung
  sensibler Inhalte.

## Ablauf in 6-10 Wochen (Kadenz)

### Woche 0: Vorbereitung

- Projekt auswählen, Sponsor benennen, PRO bestätigen.

- Scope des Piloten, Zielmetriken und Erfolgskriterien festlegen.

- Baseline-0-Termin und Report-Rhythmus vereinbaren.

### Woche 1-2: MV-CDPM aufsetzen

- Basis-Kontext anlegen (Goals, Scope, Timeline, Budget, Risks,
  Dependencies, Success Criteria, erste Milestones).

- Erste Analyse (Vollständigkeit, Triade-Spannungen, kritischer Pfad) →
  Top-10 Action Items mit Zielbezug.

- Destillationskanäle klären (E-Mail-Alias, Meeting-Tagging,
  Tool-Ingest); Daily Destillation Window (10-20 min) etablieren.

- Rolling-Forecast als Projektion sichtbar machen; Baseline-0 ziehen.

### Woche 3-6: Kreislauf stabilisieren

- Kontinuierliche Updates → Destillate → Commits; Analyse-Findings
  priorisieren.

- Guidance: Splitting/Merging, Re-Priorisierung nach
  Zielbeitrag/Risiko/Zeiteffekt.

- Weekly Context Review (60 min): Hotspots, Puffer, kritische Pfade,
  Entscheidungen.

- Bi-weekly Forecast Update: Szenarien („+1 Team", „-2 Features",
  „+150 k") mit expliziten Triade-Effekten.

### Woche 7-10: Wirkung belegen & skalieren

- Metriken reviewen (Delta-Latenz, Context-Freshness,
  Forecast-Stability, Coverage, Risk Burn-down, Outcome-Alignment).

- „Before/After" im Management-Review zeigen; Lessons Learned → Standard
  (Vorlagen, Checklisten, Schwellenwerte).

- Entscheidung: Roll-out auf zweite Projektkategorie / Portfolio-Pilot.

## Quick-Wins und Messgrößen

### Quick-Wins (typisch):

1.  **Schnelle Transparenz:** In Tagen einen belastbaren Projektstatus etablieren, statt in Wochen.
2.  **Effizientere Meetings:** Meetings werden von Informationsabgleich zu Entscheidungs-Workshops. Das gemeinsame Lagebild ist bereits vorhanden, die Diskussion startet sofort auf strategischer Ebene.
3.  **Beschleunigtes Onboarding:** Neue Teammitglieder sind in Stunden statt Wochen produktiv. Der zentrale Kontext bietet ein vollständiges Bild über Ziele, Historie und aktuellen Stand des Projekts.
4.  **Objektive Priorisierung:** Priorisierung folgt dem Projekt-Impact, nicht der lautesten Meinung. Entscheidungen werden objektiv nachvollziehbar und am Beitrag zum Projektziel ausgerichtet.
5.  **Gesteigertes Vertrauen der Stakeholder:** Schluss mit dem „Wassermelonen-Reporting" (außen grün, innen rot). Radikale Transparenz und die Möglichkeit zur Selbstauskunft schaffen Vertrauen und reduzieren politische Manöver.
6.  **Frühwarnsystem für Abhängigkeiten:** Dominoeffekte werden sofort sichtbar. Das System agiert als Frühwarnsystem, indem es die Auswirkungen von Verzögerungen auf den gesamten Projektplan in Echtzeit aufzeigt.
7.  **Reporting als Nebenprodukt:** Automatisierte Berichte halbieren den manuellen Aufwand.
8.  **Bessere Entscheidungen:** „Was-wäre-wenn"-Szenarien risikofrei vor dem Commit durchspielen.

### Messgrößen (Auszug):

- Delta Latency ↓, PX ↓, DoCR ↑, Forecast Stability ↓ Varianz

- Adoptions-KPIs für KI (falls aktiv): Destillat-Precision/Recall,
  Annahmequote von Vorschlägen, Forecast-Accuracy-Delta.

## Typische Stolpersteine & Gegenmaßnahmen

### Tool-First statt Context-First.

**Gegenmaßnahme:** Tooling minimal halten; jede Änderung muss zuerst im
Kontext landen, Artefakte sind Projektionen.

### „Alles ins Backlog" ohne klares Ziel.

**Gegenmaßnahme:** Destillationsregel „ein Update, eine Zielkomponente" durchsetzen; ohne klare Zuordnung kein Commit.

### Verantwortungsdiffusion.

**Gegenmaßnahme:** PRO als Single-Point-of-Truth benennen; RACI im Kick-off
klären; Freigaberegel schriftlich.

### Über-Priorisierung von Kapazität.

**Gegenmaßnahme:** Priorisierung strikt auf Zielbeitrag/Risiko/Zeiteffekt
ausrichten; Kapazität folgt Kontext.

### Daten-Compliance unscharf.

**Gegenmaßnahme:** Pseudonymisierung, Zugriffsprotokolle, definierte
Speicherorte; kleine DPIA falls nötig.

## Change-Management & Kommunikation

- **Narrativ:** Weniger Politik, mehr Wirkung. Entscheidungen werden
  erklärbar, Reporting leichter, Überraschungen seltener.

- **Formate:** Kurz-Demo der SSOT, „Live-Destillation" aus einer echten
  E-Mail, What-if-Szenario vor Sponsoren.

- **Rituale verankern:** Daily Destillation Window, Weekly Context Review,
  Bi-Weekly Forecast Update.

- **Enablement:** Quick-Guides (1-Pager), Kontext-Vorlagen nach Projekttyp,
  Checkliste „Definition of Done (Destillat)".

## Im Anschluss: Skalierung & Standardisierung

- **Standard-Kit:** Kontext-Templates je Projekttyp, Schwellenwerte (AT/€),
  Destillationsleitfaden, Rollenbeschreibung PRO, KPI-Deck.

- **Portfolioblick:** Vergleichbare Kontexte erlauben objektive
  Ressourcen-Allokation; Reporting wird organisationsweit homogen.

- **Reifegrade KI:** von M0 (manuell) bis M3 (proaktiv, immer mit Freigabe)
  - Pilot liefert Datengrundlage.

## Aufwand & Investment

- **Zeit:** PRO-Aufwand initial 1-2 PT/Woche, später 0,5-1 PT/Woche je
  nach Update-Volumen.

- **Tooling:** Nutzung bestehender Plattformen genügt für den Start; Invest
  in Konnektoren/Automatisierung nachweisgetrieben.

- **Change/Enablement:** kurze Trainings, 1-Pager, Brown-Bag-Sessions,
  Live-Demos.

## Zusammenfassung

CDPM lässt sich ohne Bruch einführen: klein starten, Kontext führen,
Wirkung messen, skalieren. Der Pilot macht den Kern erfahrbar - Kontext
statt Artefakt - und zeigt, wie aus fragmentierten Informationen eine
lebendige Projektwahrheit entsteht, die Entscheidungen beschleunigt,
Risiken senkt und Reporting zum Nebenprodukt macht.