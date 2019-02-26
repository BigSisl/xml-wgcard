<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page">
        <form action="wgcard-apply.php" method="POST">
			<h4>Neue WG erfassen</h4>
			<p>Bitte gebt alle benötigten Informationen ein und schliesst dann den Vorgang mit dem Button 'WG Card bestellen!' ab. Wir freuen uns, dass sie sich bei uns registrieren.</p>
			<h5>WG Mitglieder (min. 2)</h5>
            <div id="wg-members">
                <div class="field wg-member">
					<h6>WG Mitglied #<span class="wg-member-number">1</span></h6>
					<div class="field">
						<label>Ansprechsperson</label>
						<input type="checkbox" name="contact-person" />
					</div>
					
					<div class="field">
						<label>Geschlecht</label>
						<select>
							 <option value="female">weiblich</option>
							 <option value="male">männlich</option>
						</select>
					</div>
			
					<div class="field">
						<label>Vorname</label>
						<input type="text" name="firstname" />
					</div>
					
					<div class="field">
						<label>Nachname</label>
						<input type="text" name="lastname" />
					</div>
					
					<div class="field">
						<label>E-Mail</label>
						<input type="text" name="mail" />
					</div>
					
					<div class="field">
						<label>Tel</label>
						<input type="text" name="tel" />
					</div>
                </div>
            </div>
            <!-- some js to add another member -->
            <button name="addmember">WG Mitglied hinzufügen.</button>

			<h5>WG Adresse</h5>
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

            <div class="field">
                <input name="submit" type="submit" value="WG Card bestellen!" />
            </div>
        </form>
    </xsl:template>
</xsl:stylesheet>
