<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:wg="http://wgcard.xml.hslu.ch/wgs">
    <xsl:import href="page.xsl" />

	<xsl:template match="wg:wg">
		<xsl:call-template name="title"/>
		<xsl:call-template name="wg-members"/>
		<xsl:call-template name="address"/>
		<hr/>
    </xsl:template>
	
	<xsl:template name="title">
		<h2><xsl:value-of select="wg:alias"/></h2>
	</xsl:template>
	
	<xsl:template name="address">
		<h3>Adresse</h3>
		<b>Strasse: </b><xsl:value-of select="wg:address/wg:street"/><br/>
		<b>PLZ: </b><xsl:value-of select="wg:address/wg:zip"/><br/> 
		<b>Ort: </b><xsl:value-of select="wg:address/wg:city"/>
	</xsl:template>
	
	<xsl:template name="wg-members">
		<h3>Members</h3>
		<xsl:for-each select="wg:wg-members/wg:wg-member">
			<b>Primäre Ansprechsperson: </b><xsl:value-of select="wg:contactPerson"/><br/>
			<xsl:call-template name="person"/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="person">
		<b>Vorname: </b><xsl:value-of select="wg:person/wg:firstName"/><br/> 
		<b>Nachname: </b><xsl:value-of select="wg:person/wg:lastName"/><br/>
		<b>Mail: </b><xsl:value-of select="wg:person/wg:email"/><br/>
		<b>Tel: </b><xsl:value-of select="wg:person/wg:tel"/><br/><br/>
	</xsl:template>
</xsl:stylesheet>
