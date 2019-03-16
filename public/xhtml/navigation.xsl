<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:n="http://wgcard.xml.hslu.ch/navigation"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:template name="navigation">
        <xsl:param name="active-link" select="index.xml" />
        <ul>
            <xsl:for-each select="document('../navigation.xml')//n:item">
                <li>
                    <xsl:if test="$active-link = @link">
                        <a href="{@link}" class="active"><xsl:value-of select="text()" /></a>
                    </xsl:if>
                    <xsl:if test="$active-link != @link">
                        <a href="{@link}"><xsl:value-of select="text()" /></a>
                    </xsl:if>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
</xsl:stylesheet>
