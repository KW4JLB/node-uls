/**
 * Home controller handling the main page routes
 */

const config = require('../config');

/**
 * Render the home page
 */
const getHomePage = (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>${config.app.name}</title>
      <link rel="stylesheet" href="/css/style.css">
    </head>
    <body>
      <div class="container">
        <header>
          <h1>${config.app.name}</h1>
        </header>
        <main>
          <p>Welcome to the ULS Explorer application!</p>
          <p>This is a web-based application for querying the FCC Universal Licensing System.</p>
          <p>The application is currently under development.</p>
        </main>
        <footer>
          <p>&copy; ${new Date().getFullYear()} - ${config.app.name}</p>
        </footer>
      </div>
      <script src="/js/main.js"></script>
    </body>
    </html>
  `);
};

module.exports = {
  getHomePage
};
