<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns:wg="http://wgcard.xml.hslu.ch/wgs" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
            <head>
                <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
                <link href="css/main.css" rel="stylesheet" type="text/css" />
                <script src="js/jquery-3.3.1.min.js" type="application/javascript" lang="javascript"></script>

                <xsl:apply-templates select="/p:page/p:head-add" />

                <title><xsl:value-of select="/p:page/@title" /></title>
            </head>
            <body>
                <div id="header">
                    <a href="index.xml">
						<img src="img/logo.png" alt="WG Card Logo" />
					</a>
                </div>
                <div id="content">
                    <xsl:apply-templates />
                </div>
                <div id="footer">HSLU 2019</div>
            </body>
        </html>
    </xsl:template>
	
    <xsl:template match="//p:head-add">
        <xsl:copy-of select="*" />
    </xsl:template>
</xsl:stylesheet>
