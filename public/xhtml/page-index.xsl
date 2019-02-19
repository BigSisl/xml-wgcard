<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <!-- because of reasons? page doesn't work here??? -->
    <xsl:template match="*">
        <a href="get-wgcard.xml">Hol dir jetzt die neue WG Card!</a>
    </xsl:template>
</xsl:stylesheet>
