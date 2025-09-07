/**
 * Application configuration
 * Loads environment variables and provides a centralized configuration object
 */

// Load environment variables from .env file
const dotenv = require('dotenv');
dotenv.config();

const config = {
  server: {
    port: process.env.PORT || 3000,
    nodeEnv: process.env.NODE_ENV || 'development',
  },
  app: {
    name: process.env.APP_NAME || 'ULS Explorer',
  },
};

module.exports = config;
