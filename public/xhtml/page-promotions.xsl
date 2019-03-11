<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:pr="http://wgcard.xml.hslu.ch/promotions">
    <xsl:import href="page.xsl" />

    <xsl:template match="pr:promotion">
        <h2><xsl:value-of select="pr:name"/></h2>
        <b>Aufgeschaltet: </b><xsl:value-of select="@added"/><br/>
        <b>Anbieter: </b><xsl:value-of select="pr:provider"/><br/>
        <b>Kurzbeschreibung: </b><xsl:value-of select="pr:description"/><br/>
        <b>Rabatt: </b><xsl:value-of select="pr:discount"/><br/>
        <b>Noch Verfügbar: </b><xsl:value-of select="pr:amount"/>
        <hr/>
    </xsl:template>
</xsl:stylesheet>
