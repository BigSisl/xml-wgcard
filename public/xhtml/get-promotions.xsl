<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:pr="http://wgcard.xml.hslu.ch/promotions">
	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>
	<xsl:template match="pr:promotion">
		<h2><xsl:value-of select="pr:name"/></h2>
		<xsl:value-of select="pr:provider"/><br/>
		<xsl:value-of select="pr:description"/><br/>
		<xsl:value-of select="pr:discount"/><br/> 
		<xsl:value-of select="pr:amount"/>
		<hr/>
    </xsl:template>
</xsl:stylesheet>