---
documentclass: extarticle
author:
  - Lucien Zürcher
  - Fabian Brand
  - Moritz Küttel
title: "Factsheet XML Projekt: WGCard"
subtitle: "Eine Plattform für Vergünstigungen für Wohngemeinschaften"
geometry: "margin=1in"
fontsize: 10pt
numbersections: false
linkcolor: #0000ff;

---

# Einleitung

Als Teil der XML Blockwoche im Frühjahr 2019 an der Hochschule Luzern haben wir eine Platform für Vergünstigungen für Wohngemeinschaften unter Verwendung von XML und JSON Technologien entwickelt. Die Plattform ist erreichbar unter der folgenden URL:

[http://wgcard.zuercher.io](http://wgcard.zuercher.io)

Der Quellcode inklusive Versionshistorie ist auf GitHub zu finden:

[https://github.com/bigSisl/XML-WGCard](https://github.com/bigSisl/XML-WGCard)

# Konzept

Die Idee der Plattform ist, dass Firmen mit Vergünstigungen werben
können, um hauptsächlich junge Leute die in einer Wohngemeinschaft
wohnen zu erreichen. Wir bieten diesen die Möglichkeit Promotionen zu auf
unsere Plattform auszuschalten, welche dann für die Wohngemeinschaften
ersichtlich sind. Zum Beispiel kann ein Hallenbad eine
Vergünstigung von 10% auf Hallenbadbesuche anbieten.

Wohngemeinschaften können sich auf der Plattform anmelden und erhalten
damit eine WGCard mit einem Barcode, die Sie entweder ausdrucken
oder auf dem Smartphone speichern können. Besuchen nun Mitbewohner
der Wohngemeinschaft eines der Geschäfte um von der Vergünstigung zu
profitieren, können diese sich mit der WGCard ausweisen. Die Geschäfte
können anschliessend die WGCard scannen und die Promotion mittels WGCard
einlösen. Im Gegenzug erhalten Sie Zugriff auf die Daten der 
Wohngemeinschaft, die Sie dann weiter verwerten können. 
Die Vermittlungsgebühr wird dann von der Platform in Rechnung gestellt.

Im Markt gibt es bereits ähnliche Systeme wie zum Beispiel die
StuCard. Jedoch benötigt man dafür ein Bankkonto und man bekommt immer
Briefe. Unsere Plattform modernisiert das Konzept und das Ganze kann
online geschehen.

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

# Architektur

## WGCard bestellen

Wohngemeinschaften können sich im dafür vorgesehenen Benutzerinterface eintragen, um für jedes Mitglied eine WGCard zu erhalten.
Dafür müssen Sie ihre Daten inklusive Wohnadresse angeben. Anschliessend erhalten Sie ein mit FO generiertes PDF mit einer WG Card für jedes Mitglied.


## Promotion aufschalten

Das Aufschalten von Promotionen ist öffentlich und
kann unter /add-promotion.xml gemacht werden. Die
Felder werden clientseitig durch ein JSON-Schema und
serverseitig durch ein XML-Schema validiert.

Wenn eine Promotion erstellt wird, erhält man ein einmalig generiertes,
randomisiertes Token, welches serverseitig gespeichert wird.
Dieses Token ermöglicht dem Ersteller das abziehen von genutzten Vergünstigungen.

## Promotioneinlösen

TODO:
Durch das Token kann auf die Promotion zugegriffen werden.
Der Link _/promotion_access.xml ermöglicht die Eingabe des Tokens und dem
Barcode der WG, welche die Promotion nutzt. Anschliessend werden die
Daten der WG zurückgegeben, somit erhalten die Geschäfte die Möglichkeit, diese
weiter zu verwerten.

Es wurden keine Sicherheitsmassnahmen gegen Bruteforceattecken implementiert.

## Verwendete Frameworks

Wir setzen zwei XSLT Skripts von RenderX ein, um die SVGs für die Barcodes
zu generieren. Diese sind im `public/svg` Verzeichis zu finden.

Clientseitig haben wir neben dem klassischen JQuery als Unterstützung
auch ajv.js verwendet. Diese Bibliothek hilft beim Validieren von JSON
Objekten mit JSON-Schemas.


## Technische Stolpersteine

Da die .xml Dokumente komplett ausgeliefert werden müssen bei Verwendung von
clientseitigem XSLT, können darin keine Geheimnisse wie die Tokens übermittelt
werden. Deshalb muss PHP eingesetzt werden, um diese Daten zu trennen und wieder
zusammenzuführen.

## Einsatz von nicht XML/JSON-Technologien

Wir verwenden PHP auf der Serverseite, um IDs, Tokens und Barcode Werte (nicht
die eigentlichen Barcodes) zu generieren. Zusätzlich wird auch PHP verwendet, um
XML Dateien zu ergänzen, auszulesen und die Barcodes/Promo-Tokens zu validieren.

# Fazit

Wir konnten ein Minimum Viable Product implementieren.
