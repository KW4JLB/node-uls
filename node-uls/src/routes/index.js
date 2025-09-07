/**
 * Main router that combines all application routes
 */

const express = require('express');
const router = express.Router();

// Import route modules
const homeController = require('../controllers/homeController');
const healthRoutes = require('./health');

// Home page route
router.get('/', homeController.getHomePage);

// About page route
router.get('/about', homeController.getAboutPage);

// Register health routes
router.use('/api', healthRoutes);

module.exports = router;
