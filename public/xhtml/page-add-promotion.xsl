<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page">
        <form action="../php/promotion-apply.php" method="POST" onsubmit="return validateForm();">
			<h4>Neue Vergünstigung hinzufügen</h4>
			<div class="field">
				<label>Kunde</label>
				<input type="text" name="provider" />
			</div>
			
			<div class="field">
				<label>Bezeichnung</label>
				<input type="text" name="name" />
			</div>
	
			<div class="field">
				<label>Beschreibung</label>
				<input type="text" name="description" />
			</div>
			
			<div class="field">
				<label>Rabatt</label>
				<input type="text" name="discount" />
			</div>
			
			<div class="field">
				<label>Anzahl</label>
				<input typ="text" name="amount" />
			</div>
			
			<div class="field">
                <input name="submit" type="submit" value="Promotion hinzufügen!" />
            </div>
        </form>
		<script>
            //<![CDATA[
				function validateForm(){					
					return validatePromotionInformation();
				}
				
				function validatePromotionInformation(){
					if(!validatePromotionField("provider", "Kunde")){
						return false;
					}
					
					if(!validatePromotionField("name", "Bezeichnung")){
						return false;
					}
					
					if(!validatePromotionField("description", "Beschreibung")){
						return false;
					}
					
					if(!validatePromotionField("discount", "Rabatt")){
						return false;
					}
					
					if(!validatePromotionField("amount", "Anzahl")){
						return false;
					}
					
					return true;
				}
				
				function validatePromotionField(inputName, displayName){
					var inputValue = $("input[name=" + inputName + "]").val();
					if(inputValue == ""){
						alert(displayName + " muss ausgefüllt sein.")
						return false;
					}
					return true
				}
            //]]>
        </script>
    </xsl:template>
</xsl:stylesheet>
