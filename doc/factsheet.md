# Factsheet WGCard Projekt

## Verwendete 3rd Partei Bibliotheken

### Browser

Im Browser habe wir neben dem klassischen JQuery
als Unterstützung auch ajv.js verwendet. Diese
Bibliothek hilft beim validieren von JSON Objekten
mit JSON-Schemas.

## Promotionaufschalten

Das Aufschalten von Promotionen ist öffentlich und
kann unter /add-promotion.xml gemacht werden. Die
Felder werden Clientseitig durch ein JSON-Schema und
Serverseitig durch ein XML-Schema validiert.

Wenn eine Promotion erstellt wird, erhält man ein
randomisiertes Token. Dieses Token ermöglicht dem
Ersteller das abziehen von genutzten Vergünstigungen.

TODO:

Dies kann durch den Link ... ein Eingabe des Tokens
bewerkstelligt werden. Es wurden keine
Sicherheitsmassnahmen gegen Bruteforceattecken implementiert.
