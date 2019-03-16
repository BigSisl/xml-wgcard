<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page/p:content">
        <form action="../php/wgcard-apply.php" method="POST" onsubmit="return validateForm();">
            <h4>Neue WG erfassen</h4>
            <p>Bitte gebt alle benötigten Informationen ein und schliesst dann den Vorgang mit dem Button 'WG Card bestellen!' ab. Wir freuen uns, dass sie sich bei uns registrieren.</p>
            <h5>WG Mitglieder (min. 2)</h5>
            <div id="wg-members">
                <div class="field wg-member">
                    <h6>WG Mitglied #<span class="wg-member-number">1</span></h6>
                    <div class="field">
                        <label>Ansprechsperson</label>
                        <input type="checkbox" name="contactPerson1" />
                    </div>

                    <div class="field">
                        <label>Vorname</label>
                        <input type="text" name="firstname1" />
                    </div>

                    <div class="field">
                        <label>Nachname</label>
                        <input type="text" name="lastname1" />
                    </div>

                    <div class="field">
                        <label>E-Mail</label>
                        <input type="text" name="mail1" />
                    </div>

                    <div class="field">
                        <label>Tel</label>
                        <input type="text" name="tel1" />
                    </div>
                </div>
            </div>

            <div class="field">
                <input name="addmember" type="button" value="WG Mitglied hinzufügen" onclick="addWGMember();" />
            </div>

            <h5>WG Adresse</h5>

            <div class="field">
                <label>WG-Name</label>
                <input type="text" name="alias" />
            </div>

            <div class="field">
                <label>Strasse</label>
                <input type="text" name="street" />
            </div>

            <div class="field">
                <label>PLZ</label>
                <input type="text" name="zip" />
            </div>

            <div class="field">
                <label>Ort</label>
                <input type="text" name="city" />
            </div>

            <input type="hidden" name="membercount" value="1"/>

            <div class="field">
                <input name="submit" type="submit" value="WG Card bestellen!" />
            </div>
        </form>
    </xsl:template>
</xsl:stylesheet>
