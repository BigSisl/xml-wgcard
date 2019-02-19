<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
            <head>
                <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
                <link href="css/main.css" rel="stylessheet" type="text/css" />

                <!-- because of reasons /page/@title doesn't work here??? -->
                <title><xsl:value-of select="/*/@title" /></title>
            </head>
            <body>
                <div id="header">
                    <img src="img/logo.png" alt="WG Card Logo" />
                </div>
                <div id="content">
                    <xsl:apply-templates />
                </div>
                <div id="footer">HSLU 2019</div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
