<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns:wg="http://wgcard.xml.hslu.ch/wgs" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page">
        <div>
            <h2>Update Promotion</h2>
        </div>

        hey

        <xsl:if test="not(p:token)">
            <h3></h3>
            <form>
                <label>Enter Token:</label>
                <input type="text"></input>
            </form>
        </xsl:if>
        <xsl:apply-templates select="p:token" ></xsl:apply-templates>
    </xsl:template>

    <xsl:template match="p:token">
        print out promotion information here:
        <xsl:value-of select="token"></xsl:value-of>
    </xsl:template>
</xsl:stylesheet>