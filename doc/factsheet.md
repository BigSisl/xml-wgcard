---
documentclass: extarticle
author:
  - Lucien Zürcher
  - Fabian Brand
  - Moritz Küttel
title: "Factsheet XML Projekt: WGCard"
subtitle: "Eine Plattform für Vergünstigungen für Wohngemeinschaften"
geometry: "margin=0.8in"
fontsize: 10pt
numbersections: false
linkcolor: #0000ff;

---

# Einleitung

Als Teil der XML Blockwoche im Frühjahr 2019 an der Hochschule Luzern haben wir eine Platform für Vergünstigungen für Wohngemeinschaften unter Verwendung von XML und JSON Technologien entwickelt. Die Plattform ist erreichbar unter der folgenden URL:

[http://wgcard.zuercher.io](http://wgcard.zuercher.io)

_Der Server wird täglich um 01:00 zurückgesetzt_

Der Quellcode inklusive Versionshistorie ist auf GitHub zu finden:

[https://github.com/bigSisl/XML-WGCard](https://github.com/bigSisl/XML-WGCard)

# Konzept

Firmen sollen mit dieser Platform durch aufschalten von Promotionen
gezielt junge Leute in Wohngemeinschaften erreichen können. Die Promotionen
können nur mit einer validen Karte eingelöst werden. Zum Beispiel kann
ein Hallenbad eine Vergünstigung von 10% auf Hallenbadbesuche anbieten.

Wohngemeinschaften können sich auf der Plattform anmelden und erhalten
damit eine WGCard mit einem Barcode. Diese kann entweder ausgedruckt
oder auf dem Smartphone gespeichert werden. Besuchen nun Mitbewohner
der Wohngemeinschaft eines der Geschäfte um von der Vergünstigung zu
profitieren, können diese sich mit der WGCard ausweisen. Die Geschäfte
können anschliessend die WGCard scannen und die Promotion mittels WGCard
einlösen. Im Gegenzug erhalten Sie Zugriff auf die Daten der
Wohngemeinschaft, die Sie dann weiter verwerten dürfen.
Die Vermittlungsgebühr wird von der Platform in Rechnung gestellt.
Jede natürliche oder juristische Person kann eine Promotion aufschalten,
verpflichtet sich jedoch dadurch, eine bestimmte Vermittlungsgebühr beim
Promotionen einlösen zu übernehmen.

Im Markt gibt es bereits ähnliche Systeme wie zum Beispiel die
StuCard. Jedoch benötigt man dafür ein Bankkonto und man bekommt immer
Briefe. Unsere Plattform modernisiert das Konzept und die Promotionen
sind live online ersichtlich.

# Architektur

Die Architektur besteht aus drei verschiedenen Grundfunktionen, die
von der Platform bereitgestellt werden.

## WGCard bestellen

Wohngemeinschaften können sich im dafür vorgesehenen Benutzerinterface eintragen,
um für jedes Mitglied eine WGCard zu erhalten. Dafür müssen Sie ihre Daten
inklusive Wohnadresse angeben. Anschliessend erhalten Sie ein mit FO generiertes
PDF mit einer WG Card für jedes Mitglied.

## Promotion / Vergünstigung aufschalten

Das Aufschalten von Promotionen ist öffentlich und
kann unter _/add-promotion.xml_ gemacht werden. Die
Felder werden clientseitig durch ein JSON-Schema und
serverseitig durch ein XML-Schema validiert.

Wenn eine Promotion erstellt wird, erhält man ein einmalig generiertes,
randomisiertes Token, welches serverseitig gespeichert wird.

## Promotioneinlösen

Durch das Token kann auf die Promotion zugegriffen werden.
Der Link _/use-promotion.xml ermöglicht die Eingabe des Tokens und dem
Barcode der WG, welche die Promotion nutzt. Beim Aufruf wird automatisch
eine Nutzung der Promotion abgezogen. Anschliessend werden die
Daten der WG zurückgegeben, somit erhalten die Geschäfte die Möglichkeit, diese
weiter zu verwerten.

## Verwendete Frameworks

Wir setzen zwei XSLT Skripts von RenderX ein, um die SVGs für die Barcodes
zu generieren. Diese sind im `svg` Verzeichis zu finden.

Clientseitig haben wir neben dem klassischen JQuery als Unterstützung
auch ajv.js verwendet. Diese Bibliothek hilft beim Validieren von JSON
Objekten mit JSON-Schemas.


## Technische Stolpersteine

Da die .xml Dokumente komplett ausgeliefert werden müssen bei Verwendung von
clientseitigem XSLT, können darin keine Geheimnisse wie die Tokens übermittelt
werden. Deshalb musste PHP eingesetzt werden, um diese Daten zu trennen und in
einem geschützten Bereich aufzubewahren.

## Einsatz von nicht XML/JSON-Technologien

Wir verwenden PHP auf der Serverseite, um IDs, Tokens und Barcode Werte (nicht
die eigentlichen Barcodes) zu generieren. Zusätzlich wird auch PHP verwendet, um
XML Dateien zu ergänzen, auszulesen und die Barcodes/Promo-Tokens zu validieren.

# Fazit

Wir konnten mittels XML Technologien ein Minimum Viable Product implementieren.
XSLT besitzt viele Vorteile beim Prozessieren von Dokumenten und XSD ermöglicht
eine zusätzliche Absicherung mithilfe von deskriptiven Mitteln. Beim Erstellen
von PDF-Dokumenten erwies sich dies als sehr hilfreich, jedoch würden wir in
Zukunft keine Webseite nur mit diesen Technologien erstellen. Das strikte
Einhalten der Standards ist teils ungünstig und verlangsamt die Arbeit.
Beispielsweise verwenden viele Frameworks Templateengines die XSD sauber ersetzen
können und zudem einfacher sind. Ebenso wird teils die Validierung im Code der
deskriptiven Validierung bevorzugt.
