<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:p="http://wgcard.xml.hslu.ch/page"
    xmlns:pr="http://wgcard.xml.hslu.ch/promotions">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page/p:content">
        <ul>
            <li><a class="active" href="index.xml">Home</a></li>
            <li><a href="get-wgcard.xml">Neue WG</a></li>
            <li><a href="add-promotion.xml">Neue Vergünstigung</a></li>
        </ul>
        <div class="promotion-container">
            <xsl:apply-templates select="document('../promotions.xml')" />
        </div>
    </xsl:template>

    <xsl:template match="//pr:promotion">
        <div class="promotion-item">
            <h2><xsl:value-of select="pr:name"/></h2>
            <span class="promo-date"><xsl:value-of select="@added"/></span>
            <hr></hr>
            <b>Anbieter: </b><xsl:value-of select="pr:provider"/><br/>
            <b>Kurzbeschreibung: </b><xsl:value-of select="pr:description"/><br/>
            <b>Rabatt: </b><xsl:value-of select="pr:discount"/><br/>
            <b>Noch Verfügbar: </b><xsl:value-of select="pr:amount"/>
        </div>
    </xsl:template>
</xsl:stylesheet>
