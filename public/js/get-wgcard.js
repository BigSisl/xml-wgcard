WGSchema = Validation.getSchemaSynchrone('/schemas/wg-card-application.schema.json');

function addWGMember() {
    var template = $("#wg-members .field.wg-member").first();
    var wgMemberNumber = $('input[name="membercount"]').val();

    wgMemberNumber++;
    $('input[name="membercount"]').val(wgMemberNumber);
    var newWgMemberField = template.clone();

    var contactPersonInput = newWgMemberField.find('input[value="contactPerson1"]');
    contactPersonInput.prop('checked',false);
    contactPersonInput.attr("value", "contactPerson" + wgMemberNumber);

    var firstnameInput = newWgMemberField.find('input[name="firstname1"]');
    firstnameInput.val("");
    firstnameInput.attr("name", "firstname" + wgMemberNumber);

    var lastnameInput = newWgMemberField.find('input[name="lastname1"]');
    lastnameInput.val("");
    lastnameInput.attr("name", "lastname" + wgMemberNumber);

    var mailInput = newWgMemberField.find('input[name="mail1"]');
    mailInput.val("");
    mailInput.attr("name", "mail" + wgMemberNumber);

    var telInput = newWgMemberField.find('input[name="tel1"]');
    telInput.val("");
    telInput.attr("name", "tel" + wgMemberNumber);

    newWgMemberField.find(".wg-member-number").text(wgMemberNumber);
    $("#wg-members").append(newWgMemberField);

    extendSchema(wgMemberNumber);
}

// extends an given object with new attributes
// used for the errormessages part of the schema, there
// seems to be not dynamic way to define error messages
function extendSchemaErrorMessages(objRef, attribute, wgMemberNumber) {
    template = attribute + '1';
    target = attribute + wgMemberNumber;
    objRef[target] =
        objRef[template]
            .replace('\/' + template, '\/' + target)
            .replace('#1', '#' + wgMemberNumber);
}

function extendSchema(wgMemberNumber) {
    WGSchema.required = WGSchema.required.concat([
        "firstname" + wgMemberNumber,
        "lastname" + wgMemberNumber,
        "mail" + wgMemberNumber,
        "tel" + wgMemberNumber
    ]);

    extendSchemaErrorMessages(WGSchema.errorMessage.required, 'firstname', wgMemberNumber);
    extendSchemaErrorMessages(WGSchema.errorMessage.required, 'lastname', wgMemberNumber);
    extendSchemaErrorMessages(WGSchema.errorMessage.required, 'mail', wgMemberNumber);
    extendSchemaErrorMessages(WGSchema.errorMessage.required, 'tel', wgMemberNumber);

    extendSchemaErrorMessages(WGSchema.errorMessage.properties, 'mail', wgMemberNumber);
    extendSchemaErrorMessages(WGSchema.errorMessage.properties, 'tel', wgMemberNumber);
}
