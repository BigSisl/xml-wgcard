<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:wg="http://wgcard.xml.hslu.ch/wgs">
	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>
	<xsl:template match="wg:wg">
		<h2><xsl:value-of select="wg:alias"/></h2>
		<xsl:value-of select="wg:address/wg:street"/><br/>
		<xsl:value-of select="wg:address/wg:zip"/><br/> 
		<xsl:value-of select="wg:address/wg:city"/>
		
		<h3>Contact Person</h3>
		<xsl:value-of select="//wg:person/wg:gender"/><br/>
		<xsl:value-of select="//wg:person/wg:firstName"/><br/> 
		<xsl:value-of select="//wg:person/wg:lastName"/><br/>
		<xsl:value-of select="//wg:person/wg:email"/><br/>
		<xsl:value-of select="//wg:person/wg:tel"/>
		<hr/>
    </xsl:template>
</xsl:stylesheet>
