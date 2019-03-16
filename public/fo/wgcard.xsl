<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:wg="http://wgcard.xml.hslu.ch/wgs"
    xmlns:b="http://wgcard.xml.hslu.ch/barcodes">

    <xsl:import href="../svg/code128.xsl"/>

    <xsl:template match="/">
        <fo:root font-size="12pt" >
            <fo:layout-master-set>
                <fo:simple-page-master master-name="letter" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
                    <fo:region-body margin-top="2cm"/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after extent="3cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="letter">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:table space-after.optimum="20pt" margin-top="0pt">
                        <fo:table-column column-number="1"/>
                        <fo:table-column column-number="2"/>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block text-align="left">
                                        <fo:external-graphic src="url('img/logo.png')" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block text-align="right" color="#373e48" font-style="italic">
                                        Vergünstigungen für deine WG!
                                    </fo:block>
                                 </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
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
            Es freut uns das eure WG nun Teil der WGCard Platform ist nun von tollen Vergünsitungen in deiner Region profitieren kann. In diesem Brief findet ihr nun eure WGCards. Ihr könnt diese einfach vorweisen bei Geschäften welche eine Promotion auf WGCard aufgeschalten haben, um von den Vergünstigungen zu profitieren!
        </fo:block>

        <fo:block>
            Mit freundlichen Grüssen
        </fo:block>

        <fo:block margin-bottom="24pt">
            Euer WG Card Team
        </fo:block>

        <xsl:apply-templates />

    </xsl:template>

    <xsl:template match="wg:wg-member">
        <fo:table space-after.optimum="20pt" margin-top="0pt">
            <fo:table-column column-number="1"/>
            <fo:table-column column-number="2"/>
            <fo:table-body>
                <fo:table-row keep-together.within-page="always" background-color="#f2f5fa">
                    <fo:table-cell border="solid #373e48 1pt" padding="12pt" text-align="center">
                        <fo:block>
                            <fo:external-graphic src="url('img/logo.png')" />
                        </fo:block>

                        <fo:block>
                            Mitbewohner/in der WG
                        </fo:block>

                        <fo:block>
                            <xsl:value-of select="../../wg:alias"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell border="solid #373e48 1pt" padding="12pt" text-align="center">
                        <fo:block>
                            <xsl:value-of select="wg:person/wg:firstName"/>
                                        <xsl:text>&#x20;</xsl:text>
                                        <xsl:value-of select="wg:person/wg:lastName"/>
                        </fo:block>

                        <fo:block>
                            <xsl:value-of select="../../wg:address/wg:street"/>
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="../../wg:address/wg:zip"/>
                            <xsl:text>&#x20;</xsl:text>
                            <xsl:value-of select="../../wg:address/wg:city"/>
                        </fo:block>
                        <fo:block>
                            <xsl:variable name="wgid" select="../../@id" />
                            <fo:instream-foreign-object content-width="100%" content-height="100%">
                                <xsl:call-template name="barcode-code128">
                                    <xsl:with-param name="value" select="document('../../database/barcodes.xml')//b:barcode[@wg-id = $wgid]"/>
                                    <xsl:with-param name="subset" select="'B'"/>
                                </xsl:call-template>
                            </fo:instream-foreign-object>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <!-- don't output these into the fo xml -->
    <xsl:template match="wg:alias" />
    <xsl:template match="wg:address" />
</xsl:stylesheet>
