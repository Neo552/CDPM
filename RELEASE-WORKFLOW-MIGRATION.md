# Release Workflow Migration

## Übersicht der Änderungen

Diese Migration vereinfacht die PDF-Verteilung erheblich, indem die komplexe Repository-übergreifende Synchronisation durch direkte GitHub Release-Links ersetzt wird.

## Entfernte Komponenten

### 1. Workflow: `notify-website.yml`
- **Entfernt:** `.github/workflows/notify-website.yml`
- **Grund:** Unnötige Komplexität durch Repository-Dispatch Events
- **Ersetzt durch:** Direkte GitHub Release Asset Links

### 2. GitHub Secret
- **Kann entfernt werden:** `WEBSITE_REPO_TOKEN`
- **Verwendung:** War nur für Repository-Dispatch zur Website nötig

## Verbesserte Build-Pipeline

### Änderungen in `.github/workflows/build-pdfs.yml`

#### 1. Tag-basierte Releases
```yaml
on:
  push:
    branches: [ main ]
    tags:
      - 'v*'  # NEU: Triggert bei Tags wie v1.0, v1.1, etc.
```

#### 2. Automatische Release-Erstellung
```yaml
- name: Create Release and Upload PDFs
  if: startsWith(github.ref, 'refs/tags/')
  uses: softprops/action-gh-release@v1
  with:
    files: build/*.pdf
    generate_release_notes: true
    draft: false          # Sofort veröffentlichen
    prerelease: false
```

## Neue Release-Strategie

### Workflow für neue Releases

**Hinweis:** Aufgrund von Token-Beschränkungen erfolgt die Release-Erstellung halbautomatisch.

1. **Code committen:**
   ```bash
   git add .
   git commit -m "feat: neue Features"
   git push
   ```

2. **Tag erstellen und pushen:**
   ```bash
   git tag v1.1
   git push --tags
   ```

3. **Automatisches Ergebnis:**
   - GitHub Actions baut alle PDFs
   - PDFs werden als Workflow-Artifacts gespeichert

4. **Manueller Schritt:**
   - Release auf GitHub erstellen (über Web-Interface)
   - PDFs von den Workflow-Artifacts herunterladen
   - Als Release-Assets anhängen

   **ODER** bei existierendem Release:
   - Wenn das Release bereits existiert, werden PDFs automatisch angehängt

### Verfügbare PDF-Links

Nach dem Release sind die PDFs unter folgenden permanenten URLs verfügbar:

**Deutsche Dokumente:**
- `https://github.com/Neo552/CDPM/releases/latest/download/CDPM-Whitepaper-DE.pdf`
- `https://github.com/Neo552/CDPM/releases/latest/download/CDPM-Glossar-DE.pdf`
- `https://github.com/Neo552/CDPM/releases/latest/download/CDPM-Toolkit-DE.pdf`

**Englische Dokumente:**
- `https://github.com/Neo552/CDPM/releases/latest/download/CDPM-Whitepaper-EN.pdf`
- `https://github.com/Neo552/CDPM/releases/latest/download/CDPM-Glossary-EN.pdf`
- `https://github.com/Neo552/CDPM/releases/latest/download/CDPM-Toolkit-EN.pdf`

Diese Links zeigen **immer auf die neueste Version** und müssen auf der Website nie aktualisiert werden!

## Website-Anpassungen

### Erforderliche Änderungen auf contextdrivenpm.org

1. **Download-Links aktualisieren:**
   - Alle PDF-Download-Links durch die obigen GitHub Release URLs ersetzen
   - Keine dynamische Synchronisation mehr nötig

2. **Entfernen:**
   - Webhook/Repository-Dispatch Handler
   - PDF-Synchronisations-Logik
   - Lokale PDF-Kopien (optional, falls gewünscht)

### Vorteile der neuen Lösung

✅ **Einfachheit:** Keine Cross-Repository-Kommunikation
✅ **Zuverlässigkeit:** Direkte Links, keine Synchronisation nötig
✅ **Wartbarkeit:** Weniger bewegliche Teile
✅ **Performance:** GitHub CDN für schnelle Downloads
✅ **Versionierung:** Alte Versionen bleiben unter Release-spezifischen URLs verfügbar

## Migration durchführen

### Schritt 1: Repository-Änderungen (✅ Erledigt)
- [x] `build-pdfs.yml` für Tag-Releases angepasst
- [x] `notify-website.yml` entfernt

### Schritt 2: Erstes Tag-Release erstellen
```bash
# Sicherstellen, dass alle Änderungen committed sind
git add .
git commit -m "feat: simplify release workflow with direct GitHub links"
git push

# Neues Release mit Tag erstellen
git tag v1.1 -m "Simplified release workflow"
git push --tags
```

### Schritt 3: Website aktualisieren
- Download-Links auf GitHub Release URLs umstellen
- Synchronisations-Code entfernen
- Testen, dass alle Downloads funktionieren

## Rollback (falls nötig)

Falls Probleme auftreten, kann der alte Workflow wiederhergestellt werden:
```bash
git revert HEAD~2  # Revertiert die letzten Änderungen
git push
```

Die `notify-website.yml` kann aus der Git-History wiederhergestellt werden.