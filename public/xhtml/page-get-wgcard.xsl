<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page">
        <form action="../php/wgcard-apply.php" method="POST">
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
            <!-- some js to add another member -->
            <button name="addmember">WG Mitglied hinzufügen.</button>

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
			
			<input style="visibility:hidden;" type="text" name="membercount" value="1"/>
			
            <div class="field">
                <input name="submit" type="submit" value="WG Card bestellen!" />
            </div>
        </form>
		<script>
            //<![CDATA[
                var template = $("#wg-members .field.wg-member");
                var wgMemberNumber = +template.find(".wg-member-number").text();
                
				function addWGMember() {
                    wgMemberNumber++;
					$('input[name="membercount"]').val(wgMemberNumber);
                    var newWgMemberField = template.clone();
					
					var contactPersonInput = newWgMemberField.find('input[name="contactPerson1"]');
					contactPersonInput.attr("name", "contactPerson" + wgMemberNumber);
					
					var firstnameInput = newWgMemberField.find('input[name="firstname1"]');
					firstnameInput.attr("name", "firstname" + wgMemberNumber);
					
					var lastnameInput = newWgMemberField.find('input[name="lastname1"]');
					lastnameInput.attr("name", "lastname" + wgMemberNumber);
					
					var mailInput = newWgMemberField.find('input[name="mail1"]');
					mailInput.attr("name", "mail" + wgMemberNumber);
					
					var telInput = newWgMemberField.find('input[name="tel1"]');
					telInput.attr("name", "tel" + wgMemberNumber);
					
                    newWgMemberField.find(".wg-member-number").text(wgMemberNumber);
                    $("#wg-members").append(newWgMemberField);
                }

                $("button[name=addmember]").click(function(ev) {
                    ev.preventDefault();
                    addWGMember();
                    return false;
                });
            //]]>
        </script>
    </xsl:template>
</xsl:stylesheet>
