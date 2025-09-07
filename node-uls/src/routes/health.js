/**
 * Health check routes for application monitoring
 */

const express = require('express');
const router = express.Router();
const healthController = require('../controllers/healthController');

// Health check endpoint
router.get('/health', healthController.getHealth);

// Basic ping endpoint
router.get('/ping', (req, res) => {
  res.status(200).send('pong');
});

module.exports = router;
