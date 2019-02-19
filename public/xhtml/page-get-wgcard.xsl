<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page">
        <form action="wgcard-apply.php" method="POST">

            <div class="wg-member">
                <label>WG Mitglied #<span class="wg-member-number">1</span></label>
                <input type="text" name="name" />
            </div>
            <!-- some js to add another member -->
            <button name="add member">WG Mitglied hinzufügen.</button>

            <label>Strasse</label>
            <input type="text" name="street" />

            <label>PLZ</label>
            <input type="text" name="zip" />

            <label>Ort</label>
            <input type="text" name="city" />

            <input name="submit" type="submit" value="WG Card bestellen!"/>
        </form>
    </xsl:template>
</xsl:stylesheet>
