<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page/p:content">
        <pre id="message" class="hide">
        </pre>
        <form action="../php/add-promotion.php" method="POST">
            <h4>Neue Vergünstigung hinzufügen **</h4>

            <div>
                <h5>
                    ** Beim Ausschreiben von Vergünstigung verpflichtet man sich
                    die vorgeschriebene Vermittlungsgebühr beim Einlösen
                    einer Vergünstigung zu übernehmen. Diese wird
                    elektronisch durch eine Email Ende Monat nach Einlösung
                    eingezogen.
                </h5>
                <h5>
                    ** Konzept -> Tritt nicht auf Testplatform in Kraft.
                </h5>
            </div>

            <h5>Kunde - Rechnungsadresse</h5>
            <div class="field">
                <label>Kunde</label>
                <input type="text" name="provider" />
            </div>

            <div class="field">
                <label>Strasse</label>
                <input type="text" name="street" />
            </div>

            <div class="field">
                <label>PLZ</label>
                <input type="text" name="zip" />
            </div>

            <div class="field">
                <label>Ort</label>
                <input type="text" name="city" />
            </div>

            <h5>Vergünstigung</h5>
            <div class="field">
                <label>Bezeichnung</label>
                <input type="text" name="name" />
            </div>

            <div class="field">
                <label>Beschreibung</label>
                <input type="text" name="description" />
            </div>

            <div class="field">
                <label>Rabatt</label>
                <input type="text" name="discount" />
            </div>

            <div class="field">
                <label>Anzahl</label>
                <input type="number" name="amount" />
            </div>

            <div class="field">
                <input name="submit" type="submit" value="Promotion hinzufügen!" />
            </div>
        </form>
        <script>
            //<![CDATA[
                $('form').submit(function(e) {
                    e.preventDefault();
                    Validation.submit(this, '/schemas/add-promotion.schema.json');
                });
            //]]>
        </script>
    </xsl:template>

</xsl:stylesheet>
