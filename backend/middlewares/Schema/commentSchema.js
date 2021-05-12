const Joi = require('joi');

const commentSchema = Joi.object({

    body: Joi.string()
        .pattern(new RegExp('^[a-zA-Z0-9à-ïò-öù-üæœÆŒ ,:?!.\^\'\"\t \n \r\-]+$'))
        .min(1)
        .max(1000)
        .required(),
   

});

module.exports = commentSchema;

