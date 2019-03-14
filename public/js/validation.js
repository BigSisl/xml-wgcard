class Validation {
    static validate(schema, data) {
        console.log(schema);
        let validate = Validation.ajv.compile(schema);
        let valid = validate(data);

        if(!valid) {
            // override dataPath to get descriptive titles
            validate.errors.map(error => {
                if(typeof Validation.descriptiveTitles[error.dataPath] !== "undefined") {
                    error.dataPath = Validation.descriptiveTitles[error.dataPath];
                }
                return error;
            })
            let errors = AjvLocalize.de(validate.errors);

            Validation.setError(Validation.getErrorText(validate.errors));
        }

        return valid;
    }

    static setSuccess(text) {
        $("#message").attr("class","success");
        $("#message").text(text);
    }

    static setError(text) {
        $("#message").attr("class","error");
        $("#message").text(text);
    }

    static parseServerAnswer(data) {
        try {
            let json = data;
            if(json.type == 'success') {
                Validation.setSuccess(json.message);
            } else {
                Validation.setError(json.message);
            }
        } catch(err) {
            console.error(err);
            return data;
        }
    }

    static submit(form, schemaUrl) {
        var form = $(form);

        console.log(form);

        var url = form.attr('action');

        if(Validation.validateForm(form, schemaUrl)) {
            $.ajax({
                type: "POST",
                url: url,
                data: form.serialize(), // serializes the form's elements.
                success: Validation.parseServerAnswer
            });
        }
    }

    static getErrorText(errors) {
        // randomly seems to add data to the beginning of the line, so i remove it
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
        self.serializeArray()
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
