<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns:wg="http://wgcard.xml.hslu.ch/wgs" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="navigation.xsl" />

    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>


    <xsl:template match="/p:page">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
            <head>
                <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1"/>

                <link href="/css/fonts.css" rel="stylesheet" type="text/css" />
                <link href="/css/main.css" rel="stylesheet" type="text/css" />
                <link href="/css/navigation.css" rel="stylesheet" type="text/css" />
                <link href="/css/promotion-style.css" rel="stylesheet" type="text/css" />

                <script src="/js/jquery-3.3.1.min.js" type="application/javascript" lang="javascript"></script>
                <script src="/js/ajv-6.10.0.min.js" type="application/javascript" lang="javascript"></script>
                <!--
                <script src="/js/ajv-i18n-3.4.0.min.js" type="application/javascript" lang="javascript"></script>
                -->
                <script src="/js/ajv-errors-1.0.1.min.js" type="application/javascript" lang="javascript"></script>
                <script src="/js/validation.js" type="application/javascript" lang="javascript"></script>

                <xsl:apply-templates select="/p:page/p:head-add" />

                <title><xsl:value-of select="/p:page/@title" /></title>
            </head>
            <body>
                <div id="header" class="container">
                    <a href="/index.xml" class="logo">
                        <img src="/img/logo.png" alt="WG Card Logo" />
                    </a>
                    <p class="headline">Vergünstigungen für deine WG!</p>
                    <div class="clear" />
                </div>
                <div id="content" class="container">
                    <xsl:call-template name="navigation">
                        <xsl:with-param name="active-link" select="@link" />
                    </xsl:call-template>

                    <xsl:apply-templates />
                </div>
                <div id="footer" class="container">
                    <p class="module">HSLU 2019 XML</p>
                    <p class="author">Fabian Brand, Lucien Zürcher, Moritz Küttel</p>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="//p:head-add">
        <xsl:copy-of select="*" />
    </xsl:template>
</xsl:stylesheet>
