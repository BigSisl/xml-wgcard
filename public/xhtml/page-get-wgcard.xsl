<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://wgcard.xml.hslu.ch/page" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="page.xsl" />

    <xsl:template match="/p:page">
        <form action="wgcard-apply.php" method="POST">

            <div id="wg-members">
                <div class="field wg-member">
                    <label>WG Mitglied #<span class="wg-member-number">1</span></label>
                    <input type="text" name="name" />
                </div>
            </div>
            <!-- some js to add another member -->
            <button name="addmember">WG Mitglied hinzufügen.</button>

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
        <script>
            //<![CDATA[
                var template = $("#wg-members .field.wg-member");
                var wgMemberNumber = +template.find(".wg-member-number").text();
                function addWGMember() {
                    wgMemberNumber++;
                    var newWgMemberField = template.clone();
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
