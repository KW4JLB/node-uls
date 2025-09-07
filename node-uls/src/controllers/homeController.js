/**
 * Home controller handling the main page routes
 */

const config = require('../config');

/**
 * Render the home page
 */
const getHomePage = (req, res) => {
  res.render('pages/home', {
    title: 'Home',
    currentPage: 'home'
  });
};

/**
 * Render the about page
 */
const getAboutPage = (req, res) => {
  res.render('pages/about', {
    title: 'About',
    currentPage: 'about'
  });
};

module.exports = {
  getHomePage,
  getAboutPage
};
