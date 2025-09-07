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

// About page route (simple for now)
router.get('/about', (req, res) => {
  res.send(`
    <h1>About ULS Explorer</h1>
    <p>This application allows users to query the FCC Universal Licensing System database.</p>
    <p><a href="/">Back to Home</a></p>
  `);
});

// Register health routes
router.use('/api', healthRoutes);

module.exports = router;
