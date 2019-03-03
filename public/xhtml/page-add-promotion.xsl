<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page">
        <form action="promotion-apply.php" method="POST">
			<h4>Neue Vergünstigung hinzufügen</h4>
			
        </form>
    </xsl:template>
</xsl:stylesheet>
