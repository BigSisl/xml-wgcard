<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:wg="http://wgcard.xml.hslu.ch/wgs">

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="letter" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
                    <fo:region-body margin-top="2cm"/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after extent="3cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="letter">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="left">
                        <fo:external-graphic src="url('img/logo.png')" />
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates />
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="wg:wg">
        <fo:block text-align="right">
            WG Card
        </fo:block>

        <fo:block text-align="right">
            Fiktionalestrasse 42
        </fo:block>

        <fo:block text-align="right" margin-bottom="24pt">
            8002 Zürich
        </fo:block>

        <fo:block white-space="pre">
            <xsl:value-of select="//wg:wg-member[wg:contactPerson]//wg:firstName"/>
            <xsl:text>&#x20;</xsl:text>
            <xsl:value-of select="//wg:wg-member[wg:contactPerson]//wg:lastName"/>
        </fo:block>

        <fo:block>
            <xsl:value-of select="wg:address/wg:street"/>
        </fo:block>

        <fo:block margin-bottom="36pt">
            <xsl:value-of select="wg:address/wg:zip"/>
            <xsl:text>&#x20;</xsl:text>
            <xsl:value-of select="wg:address/wg:city"/>
        </fo:block>

        <fo:block font-weight="bold" margin-bottom="12pt">
            Herzlich Willkommen bei WG Card.
        </fo:block>

        <fo:block margin-bottom="12pt">
            Liebe WG Mitbewohner der WG "<xsl:value-of select="wg:alias"/>"
        </fo:block>

        <fo:block margin-bottom="12pt">
            Es freut uns das eure WG nun Teil der WGCard Platform ist nun von tollen Vergünsitungen in deiner Region profitieren kann. In diesem Brief findet ihr nun eure WGCards. Ihr könnt diese einfach vorweisen bei Geschäften welche eine Promotion auf WGCard aufgeschalten habt, um von den Vergünstigungen zu profitieren!
        </fo:block>

        <fo:block>
            Mit freundlichen Grüssen
        </fo:block>

        <fo:block>
            Euer WG Card Team
        </fo:block>

        <xsl:apply-templates />

    </xsl:template>

    <xsl:template match="wg:wg-member">
        <fo:block text-align="center"  margin-top="96pt">
            WG Card von <xsl:value-of select="wg:person/wg:firstName"/>
                        <xsl:text>&#x20;</xsl:text>
                        <xsl:value-of select="wg:person/wg:lastName"/>
        </fo:block>
    </xsl:template>

    <!-- don't output these into the fo xml -->
    <xsl:template match="wg:alias" />
    <xsl:template match="wg:address" />
</xsl:stylesheet>
