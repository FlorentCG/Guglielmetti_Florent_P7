const rateLimit = require('express-rate-limit');

const requestLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 15 // limit each IP to 15 requests per windowMs
});

module.exports = requestLimiter;