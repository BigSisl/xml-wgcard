class Validation {
    static validate(schema, data) {
        let Reg = data;
        let validate = Validation.ajv.compile(schema);
        let valid = validate(Reg);

        if(!valid) {
            // override dataPath to get descriptive titles
            validate.errors.map(error => {
                if(typeof Validation.descriptiveTitles[error.dataPath] !== "undefined") {
                    error.dataPath = Validation.descriptiveTitles[error.dataPath];
                }
                return error;
            })
            let errors = AjvLocalize.de(validate.errors);

            $("#message").attr("class","error");
            $("#message").append( "<p>Test</p>" );
            $("#message").text(Validation.getErrorText(validate.errors));
        }

        return false;
    }

    static getErrorText(errors) {
        // randomly seems to add data to the beginning of the line, so i remove it
        console.log(Validation.ajv.errorsText(errors));
        return Validation.ajv.errorsText(errors, { separator: '\n' })
            .replace(/^data\.?/gm, '')
    }

    static validateForm(self, url) {
        const data = Validation.getFormData(self);
        const schema = Validation.getSchemaSynchrone(url);

        return Validation.validate(schema, data);
    }

    static getFormData(self) {
        var data = {};
        $(self).serializeArray()
            .forEach(element => {
                data[element.name] = element.value;
            });
        return data;
    }

    static getSchemaSynchrone(url) {
        $.ajaxSetup({
            async: false
        });
        let schema = $.getJSON(url);
        $.ajaxSetup({
            async: true
        });
        return JSON.parse(schema.responseText);
    }

    // enable writing more descriptive names for input then
    // then the default names used of the input files
    static addDescriptiveType(input, text) {
        Validation.descriptiveTitles["." + input] = text;
    }
}
Validation.ajv = new Ajv({ allErrors: true });
Validation.descriptiveTitles = {};
