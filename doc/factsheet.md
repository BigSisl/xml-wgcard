---
documentclass: extarticle
author:
  - Lucien Zürcher
  - Fabian Brand
  - Moritz Küttel
title: "Factsheet XML Projekt: WGCard"
subtitle: "Eine Plattform für Vergünstigungen für Wohngemeinschaften"
geometry: "margin=0.75in"
fontsize: 10pt
numbersections: false
linkcolor: #0000ff;

---

# Einleitung

Als Teil der XML Blockwoche im Frühjahr 2019 an der Hochschule Luzern haben wir eine Platform für Vergünstigungen für Wohngemeinschaften unter Verwendung von XML und JSON Technologien entwickelt. Die Plattform ist erreichbar unter der folgenden URL:

[http://wgcard.zuercher.io](http://wgcard.zuercher.io) _(wird wird täglich um 01:00 zurückgesetzt)_

Der Quellcode inklusive Versionshistorie ist auf GitHub zu finden:

[https://github.com/bigSisl/XML-WGCard](https://github.com/bigSisl/XML-WGCard)

# Konzept

Unternehmen sollen mit dieser Platform durch aufschalten von Promotionen
gezielt junge Leute in Wohngemeinschaften erreichen können. Die Promotionen
können nur mit einer validen Karte eingelöst werden. Zum Beispiel kann
ein Hallenbad eine Vergünstigung von 10% auf Hallenbadbesuche anbieten.

Wohngemeinschaften können sich auf der Plattform anmelden und erhalten
damit eine WGCard mit einem Barcode. Diese kann entweder ausgedruckt
oder auf dem Smartphone gespeichert werden. Besuchen nun Mitbewohner
der Wohngemeinschaft eines der Geschäfte, um von einer Vergünstigung zu
profitieren, können diese sich mit der WGCard ausweisen. Die Unternehmen
können anschliessend die WGCard scannen und die Promotion mittels WGCard
einlösen. Im Gegenzug erhalten Sie Zugriff auf die Daten der
Wohngemeinschaft, die Sie dann weiter verwerten dürfen.
Die Vermittlungsgebühr wird den Unternehmen von der Platform
in Rechnung gestellt.
Jedes Unternehmen kann eine Promotion aufschalten, jedoch
verpflichtet man sich dadurch eine bestimmte Vermittlungsgebühr beim
einlösen einer Promotionen zu übernehmen.

Im Markt gibt es bereits ähnliche Systeme wie zum Beispiel die
StuCard. Jedoch benötigt man dafür ein Bankkonto und man bekommt immer
Briefe. Unsere Plattform modernisiert das Konzept und die Promotionen
sind online ersichtlich.

# Architektur

Mittels drei verschiedenen Features wurde das Mimium Viable Product
implementiert. Im Frontend wird XSLT eingesetzt um XHTML Seiten
zu generieren. Diese verwenden teilweise JavaScript, um die Benutzereingaben
zu validieren.

Die eingegebenen Daten werden an das PHP Backend versendet, welches
diese weiterverarbeitet und diese in XML-Dateien ablegt.

Die drei Features sind in den folgenden Abschnitten kurz beschrieben und
im Architekturdiagramm auf Seite 2 ersichtlich.

## WGCard bestellen

Wohngemeinschaften können sich auf der Seite `/get-wgcard.xml` eintragen,
um für jedes Mitglied eine WGCard zu erhalten. Dafür müssen Sie ihre Daten
inklusive Wohnadresse angeben. Anschliessend erhalten Sie ein Mithilfe von FO generiertes PDF mit einer WG Card für jedes Mitglied.

## Promotion / Vergünstigung aufschalten

Das Aufschalten von Promotionen ist öffentlich und kann unter
`/add-promotion.xml` gemacht werden. Dabei muss festgelegt werden,
wie viel mal die Promotion verwendet werden kann.

Wenn eine Promotion erstellt wird, erhält man ein einmalig generiertes,
randomisiertes Token, welches serverseitig gespeichert wird.

## Promotion einlösen

Durch das Token kann auf die Promotion zugegriffen werden.
Die Seite `/use-promotion.xml` ermöglicht die Eingabe des Tokens und dem
Barcode der WG, welche die Promotion nutzt. Beim Aufruf wird die Promotion
einmal verwendet und wir berechnen eine Vermittlung.  Zusätzlich werden hier
werden die Daten der WG zurückgegeben, welche die Unternehmen verwerten können.

## Verwendete Frameworks

Wir setzen zwei XSLT Skripts von RenderX ein, um die SVGs für die Barcodes
zu generieren. Diese sind im `svg` Verzeichis zu finden.

Clientseitig haben wir neben jQuery als Unterstützung
auch `ajv.js` verwendet, um JSON-Objekte mittles einem JSON-Schema
zu validieren.

## Technische Stolpersteine

Da die XML Dokumente komplett ausgeliefert werden müssen bei Verwendung
von clientseitigem XSLT, können darin keine Geheimnisse wie die Tokens
übermittelt werden. Deshalb musste PHP eingesetzt werden, um diese
Daten zu trennen und in einem geschützten Bereich aufzubewahren.
Das Debuggen von XSLT ist teilweise nicht einfach und das Tooling auch
nicht das Beste. Jedoch waren die verfügbaren Tools z.B. zur Validierung extrem hilfreich.


## Nicht XML/JSON-Technologien

Wir verwenden PHP auf der Serverseite, um IDs, Tokens und Barcode
Werte (nicht die eigentlichen Barcodes) zu generieren und zu
überprüfen. Auch wird PHP verwendet, um XML Dateien zu
ergänzen, auszulesen und um den FO Prozessor zur Generierung der WGCards
zu starten.

Zusätzlich wird auf der Clientseite JavaScript verwendet
zur Validierung der Benutzereingaben mittels JSON-Schema.

# Fazit

Wir konnten mittels XML Technologien ein Minimum Viable Product
implementieren.  XSLT besitzt viele Vorteile beim Prozessieren von
Dokumenten und XSD ermöglicht einfache Validierung. Beim Erstellen
von PDF-Dokumenten erwies sich dies als sehr hilfreich, jedoch würden
wir in Zukunft keine Webseite nur komplett mit diesen Technologien
erstellen. Debuggen von XSLT ist teilweise schwierig, und es eignet
sich oft nur für einfachere Anwendungsfälle. XML Technologien können
jedoch super mit anderen Technologien kombiniert werden und können ein
hilfreiches Werkzeug für einen Softwareentwickler sein.
