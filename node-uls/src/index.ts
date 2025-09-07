/**
 * Main Express application file
 */

const express = require('express');
const path = require('path');
const morgan = require('morgan');
const helmet = require('helmet');
const cors = require('cors');
const fs = require('fs');
const config = require('./config');
const { requestLogger, logger } = require('./middleware/logger');
const { setupViewEngine } = require('./middleware/viewEngine');

// Create logs directory if it doesn't exist
if (!fs.existsSync('./logs')) {
  fs.mkdirSync('./logs');
}

// Create Express application
const app = express();

// View engine setup
setupViewEngine(app);

// Middleware setup
app.use(helmet({
  contentSecurityPolicy: {
    directives: {
      defaultSrc: ["'self'"],
      scriptSrc: ["'self'", "'unsafe-inline'"],
      styleSrc: ["'self'", "'unsafe-inline'"],
      imgSrc: ["'self'", "data:"]
    }
  }
})); // Security headers with CSP configured for our needs
app.use(cors()); // CORS support
app.use(express.json()); // Parse JSON bodies
app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies
app.use(morgan(config.server.nodeEnv === 'development' ? 'dev' : 'combined')); // HTTP request logging
app.use(requestLogger); // Custom request logger

// Serve static files
const staticPath = process.env.NODE_ENV === 'production'
  ? path.join(__dirname, '../dist/public')
  : path.join(__dirname, 'public');

app.use(express.static(staticPath));

// Import routes
const indexRoutes = require('./routes');

// Register routes
app.use('/', indexRoutes);

// 404 handler
app.use((req, res) => {
  res.status(404).render('pages/404', {
    title: '404 - Not Found',
    currentPage: 'error'
  });
});

// Error handler
app.use((err, req, res, next) => {
  logger.error(`Error: ${err.message}`);
  logger.error(err.stack);

  const statusCode = err.statusCode || 500;

  res.status(statusCode).render('pages/error', {
    title: 'Error',
    statusCode,
    message: err.message || 'Internal Server Error',
    details: 'An unexpected error occurred while processing your request.',
    stack: err.stack,
    showStack: config.server.nodeEnv === 'development',
    currentPage: 'error'
  });
});

// Start server
const PORT = config.server.port;
const server = app.listen(PORT, () => {
  logger.info(`Server running on port ${PORT}`);
  logger.info(`Environment: ${config.server.nodeEnv}`);
  logger.info(`URL: http://localhost:${PORT}`);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  logger.info('SIGTERM signal received: closing HTTP server');
  server.close(() => {
    logger.info('HTTP server closed');
  });
});

module.exports = app;
