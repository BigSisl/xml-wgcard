<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page">
        <ul>
            <li><a href="get-wgcard.xml">Hol dir jetzt die neue WG Card!</a></li>
            <li><a href="add-promotion.xml">Schalte eine neue Vergünstigung auf!</a></li>
            <li><a href="promotions.xml">Bereits aufgeschaltete Vergünstigungen</a></li>
        </ul>
    </xsl:template>
</xsl:stylesheet>
