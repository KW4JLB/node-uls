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

// Create logs directory if it doesn't exist
if (!fs.existsSync('./logs')) {
  fs.mkdirSync('./logs');
}

// Create Express application
const app = express();

// Middleware setup
app.use(helmet()); // Security headers
app.use(cors()); // CORS support
app.use(express.json()); // Parse JSON bodies
app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies
app.use(morgan(config.server.nodeEnv === 'development' ? 'dev' : 'combined')); // HTTP request logging
app.use(requestLogger); // Custom request logger

// Serve static files
app.use(express.static(path.join(__dirname, 'public')));

// Import routes
const indexRoutes = require('./routes');

// Register routes
app.use('/', indexRoutes);

// 404 handler
app.use((req, res) => {
  res.status(404).send(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>404 - Not Found | ${config.app.name}</title>
      <link rel="stylesheet" href="/css/style.css">
    </head>
    <body>
      <div class="container">
        <header>
          <h1>${config.app.name}</h1>
        </header>
        <main>
          <h2>404 - Page Not Found</h2>
          <p>The page you are looking for does not exist.</p>
          <p><a href="/">Go back to home page</a></p>
        </main>
        <footer>
          <p>&copy; ${new Date().getFullYear()} - ${config.app.name}</p>
        </footer>
      </div>
    </body>
    </html>
  `);
});

// Error handler
app.use((err, req, res, next) => {
  logger.error(`Error: ${err.message}`);
  logger.error(err.stack);

  const statusCode = err.statusCode || 500;

  res.status(statusCode).send(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Error | ${config.app.name}</title>
      <link rel="stylesheet" href="/css/style.css">
    </head>
    <body>
      <div class="container">
        <header>
          <h1>${config.app.name}</h1>
        </header>
        <main>
          <h2>An Error Occurred</h2>
          <p>${err.message || 'Internal Server Error'}</p>
          ${config.server.nodeEnv === 'development' ? `<pre>${err.stack}</pre>` : ''}
          <p><a href="/">Go back to home page</a></p>
        </main>
        <footer>
          <p>&copy; ${new Date().getFullYear()} - ${config.app.name}</p>
        </footer>
      </div>
    </body>
    </html>
  `);
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
