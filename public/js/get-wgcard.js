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

function validateForm(){
    var members = $('input[name="membercount"]').val();

    if(members < 2){
        alert("Es müssen mindestens 2 Mitglieder eingetragen werden.");
        return false;
    }

    for(i = 1; i<=members; i++){
        if(!validateWgMember(i)){
            return false;
        }
    }

    return validateWgInformation();
}

function validateWgMember(index){
    if(!validateMemberField(getInputName("firstname", index), "Vorname")){
        return false;
    }

    if(!validateMemberField(getInputName("lastname", index), "Nachname")){
        return false;
    }

    if(!validateMemberField(getInputName("mail", index), "E-Mail")){
        return false;
    }

    if(!validateMemberField(getInputName("tel", index), "Tel")){
        return false;
    }

    return true;
}

function validateWgInformation(){
    if(!validateWgField("alias", "WG-Name")){
        return false;
    }

    if(!validateWgField("street", "Strasse")){
        return false;
    }

    if(!validateWgField("zip", "PLZ")){
        return false;
    }

    if(!validateWgField("city", "Ort")){
        return false;
    }

    return true;
}

function getInputName(name, index){
    return name + index;
}

function validateMemberField(inputName, displayName){
    var inputValue = $("input[name=" + inputName + "]").val();
    if(inputValue == ""){
        alert(displayName + " muss für alle Mitglieder ausgefüllt sein.")
        return false;
    }
    return true
}

function validateWgField(inputName, displayName){
    var inputValue = $("input[name=" + inputName + "]").val();
    if(inputValue == ""){
        alert(displayName + " muss ausgefüllt sein.")
        return false;
    }
    return true
}
