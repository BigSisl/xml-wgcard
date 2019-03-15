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

Wenn eine Promotion erstellt wird, erhält man einmailig
randomisiertes Token welches Serverseitig gespeichert wird.
Dieses Token ermöglicht dem Ersteller das abziehen von genutzten Vergünstigungen.

## Promotioneinlösen

TODO:
Durch das Token kann auf die Promotion zugegriffen werden.
Der Link _/promotion_access.xml_ ermöglicht die Eingabe des Tokens
mit einem Barcode welche wg diese Promotion nutzt. Anschliessend werden die
Daten der WG zurückgegeben, somit erhalten die Geschäfter die Möglichkeit diese
weiter zu verwerten.

Es wurden keine Sicherheitsmassnahmen gegen Bruteforceattecken implementiert.

## Verwendete Frameworks

* Wir setzen zwei XSLT Skripts von RenderX ein um die Barcodes zu generieren.
Diese sind im public/svg Verzeichis zu finden.
* TODO: JSON-Validation

## Technische Stolpersteine

Da die .xml dokumente Komplett ausgeliefert werden müssen bei verwendung von
client side XSLT, können darin keine Geheimnisse wie die Tokens übermittelt
werden. Deshalb muss PHP eingesetzt werden um diese Daten zu trennen und wieder
zusammenzuführen.

## Einsatz von nicht XML/JSON-Technologien

Wir verwenden PHP auf der serverseite um IDs, Tokens und Barcode Werte (nicht
die eigentlichen Barcodes) zu generieren. Ausserdem wird PHP auch verwendet um
XML Dateien zu ergänzen auszulesen und die Barcodes/Promo-Tokens zu validieren

