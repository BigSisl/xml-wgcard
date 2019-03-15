<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns:wg="http://wgcard.xml.hslu.ch/wgs" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="p:message">
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
                    <input type="text" name="token" />
                </div>

                <div class="field">
                    <label>WG Card-Code</label>
                    <input type="text" name="token" />
                </div>

                <div class="field">
                    <input name="submit" type="submit" value="Promtion Aktualisieren" />
                </div>
            </form>
        </xsl:if>
        <xsl:apply-templates select="p:token" ></xsl:apply-templates>
    </xsl:template>

    <xsl:template match="p:token">
        print out promotion information here:
        <xsl:value-of select="token"></xsl:value-of>
    </xsl:template>
</xsl:stylesheet>