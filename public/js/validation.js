class Validation {
    static validate(schema, data) {
        console.debug(schema);
        let validate = Validation.ajv.compile(schema);
        let valid = validate(data);

        if(!valid) {
            if(validate.errors.length > 3) {
                validate.errors = validate.errors.slice(0,4);
                validate.errors[3].message = '...';
            }
            console.debug(validate.errors);
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
        Validation.submitWithSchema(form, Validation.getSchemaSynchrone(schemaUrl));
    }

    static submitWithSchema(form, schema) {
        var form = $(form);

        var url = form.attr('action');

        $(window).scrollTop(0);

        if(Validation.validateForm(form, schema)) {
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
            .replace(/^data(\/[a-z0-9]+)* /gm, '');
    }

    static validateForm(self, schema) {
        const data = Validation.getFormData(self);

        console.debug(data);

        return Validation.validate(schema, data);
    }

    static getFormData(self) {
        var data = {};
        self.serializeArray()
            .forEach(element => {
                if(element.value != "") {
                    data[element.name] = element.value;
                }
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
Validation.ajv = new Ajv({ allErrors: true, jsonPointers: true });
AjvErrors(Validation.ajv /*, {singleError: true} */);

Validation.descriptiveTitles = {};
