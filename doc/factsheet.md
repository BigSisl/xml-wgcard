# Factsheet WGCard Projekt


## Inhalt des Fact Sheet (von Vorlesungsfolien / delete me afterwards please)
 * Finale Version der Konzept
 * Präsentation als Fliesstext
 * Kunde, Dienstleistung, Innovation, Marktumfeld, ...
 * URL zu Ihrer Plattform
 * Architektur
 * Diagramm
 * Verwendete Frameworks
 * Technische Stolpersteine
 * Rechtfertigung für jeden (!) Einsatz von nicht XML Technologien
 * Fazit

## Verwendete 3rd Partei Bibliotheken

### Browser

Im Browser habe wir neben dem klassischen JQuery
als Unterstützung auch ajv.js verwendet. Diese
Bibliothek hilft beim validieren von JSON Objekten
mit JSON-Schemas.

## Promotion aufschalten

Das Aufschalten von Promotionen ist öffentlich und
kann unter /add-promotion.xml gemacht werden. Die
Felder werden Clientseitig durch ein JSON-Schema und
Serverseitig durch ein XML-Schema validiert.

Wenn eine Promotion erstellt wird, erhält man ein
randomisiertes Token. Dieses Token ermöglicht dem
Ersteller das abziehen von genutzten Vergünstigungen.

## Promotion einlösen

TODO:
Durch das Token kann auf die Promotion zugegriffen werden.
Der Link /promotion_access.xml ermöglicht die Eingabe des Tokens
mit einer id, welche wg diese Promotion nutzt.
Es wurden keine Sicherheitsmassnahmen gegen Bruteforceattecken implementiert
und die Tokens können durch die promotion xml dokumente ungesichert zugegriffen werden.
Wichtig als Hinweis für ein zukünftige Verbesserung.
