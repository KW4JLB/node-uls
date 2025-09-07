/**
 * Express Middleware for setting up view rendering with EJS
 */
const path = require('path');
const expressLayouts = require('express-ejs-layouts');
const config = require('../config');

/**
 * Configure view engine and layouts for Express
 */
const setupViewEngine = (app) => {
  // Set view engine
  app.set('view engine', 'ejs');

  // Determine path to views based on environment
  const viewsPath = process.env.NODE_ENV === 'production'
    ? path.join(__dirname, '../../dist/views')
    : path.join(__dirname, '../views');

  app.set('views', viewsPath);

  // Set up layouts
  app.use(expressLayouts);
  app.set('layout', 'layouts/main');
  app.set('layout extractScripts', true);
  app.set('layout extractStyles', true);

  // Add default locals that will be available in all views
  app.use((req, res, next) => {
    res.locals.appName = config.app.name;
    res.locals.currentPage = req.path === '/' ? 'home' : req.path.slice(1);
    next();
  });
};

module.exports = {
  setupViewEngine
};
