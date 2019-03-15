<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page/p:content">
        <ul>
            <li><a href="index.xml">Home</a></li>
            <li><a href="get-wgcard.xml">Neue WG</a></li>
            <li><a class="active" href="add-promotion.xml">Neue Vergünstigung</a></li>
        </ul>
        <pre id="message" class="hide">
        </pre>
        <form action="../php/add-promotion.php" method="POST">
            <h4>Neue Vergünstigung hinzufügen</h4>
            <div class="field">
                <label>Kunde</label>
                <input type="text" name="provider" />
            </div>

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
                Validation.addDescriptiveType("provider", "Kunde");
                Validation.addDescriptiveType("name", "Bezeichnung");
                Validation.addDescriptiveType("discount", "Rabatt");
                Validation.addDescriptiveType("amount", "Anzahl");
                Validation.addDescriptiveType("description", "Beschreibung");

                $('form').submit(function(e) {
                    e.preventDefault();
                    Validation.submit(this, '/schemas/add-promotion.schema.json');
                });
            //]]>
        </script>
    </xsl:template>

</xsl:stylesheet>
