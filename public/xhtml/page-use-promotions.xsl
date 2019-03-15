<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:p="http://wgcard.xml.hslu.ch/page"
        xmlns:pr="http://wgcard.xml.hslu.ch/promotions"
        xmlns:wg="http://wgcard.xml.hslu.ch/wgs"
        xmlns:barcode="http://wgcard.xml.hslu.ch/barcodes"
        xmlns:token="http://wgcard.xml.hslu.ch/promoTokens"
        xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:import href="page-wgs.xsl" />

    <xsl:template match="pr:promotion">
        <h2><xsl:value-of select="pr:name"/></h2>
        <b>Aufgeschaltet: </b><xsl:value-of select="@added"/><br/>
        <b>Anbieter: </b><xsl:value-of select="pr:provider"/><br/>
        <b>Kurzbeschreibung: </b><xsl:value-of select="pr:description"/><br/>
        <b>Rabatt: </b><xsl:value-of select="pr:discount"/><br/>
        <b>Noch Verfügbar: </b><xsl:value-of select="pr:amount"/>
        <hr/>
    </xsl:template>

    <xsl:template match="p:message|p:error">
        <div>
            <xsl:value-of select="text()"></xsl:value-of>
        </div>
    </xsl:template>

    <xsl:template match="/p:page/p:content">
        <div>
            <h2>Business Interface für Promotionen</h2>
        </div>

        <xsl:if test="p:message">
            <div id="message" class="success">
                <xsl:apply-templates select="p:message"></xsl:apply-templates>
            </div>
        </xsl:if>

        <xsl:if test="p:error">
            <div id="message" class="error">
                <xsl:apply-templates select="p:error"></xsl:apply-templates>
            </div>
        </xsl:if>

        <xsl:if test="not(p:token)">
            <form method="GET" action="/php/use-promotion.php">
                <div class="field">
                    <label>Promotions-Token</label>
                    <input type="text" name="token" value="{@token}" />
                </div>

                <div class="field">
                    <label>WG Card-Code</label>
                    <input type="text" name="barcode" value="{@barcode}" />
                </div>

                <div class="field">
                    <input name="submit" type="submit" value="Promtion Aktualisieren" />
                </div>
            </form>
        </xsl:if>

        <xsl:if test="p:token">
            <h2>Promotion with Token: </h2>
            <pre><xsl:value-of select="@token" /></pre>
            <br />
            <xsl:apply-templates select="pr:promotion" />

            <h2>WG with Barcode:</h2>
            <pre><xsl:value-of select="p:barcode" /></pre>
            <br />
            <xsl:apply-templates select="wg:wg" />
        </xsl:if>

    </xsl:template>
</xsl:stylesheet>