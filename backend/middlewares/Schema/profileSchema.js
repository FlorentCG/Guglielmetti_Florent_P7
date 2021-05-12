const Joi = require('joi');

const profileSchema = Joi.object({

    description: Joi.string()
        .pattern(new RegExp('^[a-zA-Z0-9 ,\'\"?.-]+$'))
        .max(1000),
    

});

module.exports = profileSchema;