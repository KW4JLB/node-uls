/**
 * Unit tests for viewEngine middleware
 */

jest.mock('express-ejs-layouts', () => jest.fn());
jest.mock('path', () => ({
  join: jest.fn().mockReturnValue('/mocked/path')
}));
jest.mock('../../src/config', () => ({
  app: {
    name: 'ULS Test App'
  }
}));

describe('View Engine Middleware', () => {
  test('setupViewEngine should configure the app correctly', () => {
    const { setupViewEngine } = require('../../src/middleware/viewEngine');

    // Mock Express app
    const app = {
      set: jest.fn(),
      use: jest.fn()
    };

    // Mock middleware that calls next
    let capturedMiddleware;
    app.use.mockImplementation((middleware) => {
      if (typeof middleware === 'function') {
        capturedMiddleware = middleware;
      }
    });

    // Call the setupViewEngine function
    setupViewEngine(app);

    // Check that app.set was called for view engine and views
    expect(app.set).toHaveBeenCalledWith('view engine', 'ejs');
    expect(app.set).toHaveBeenCalledWith('views', expect.any(String));

    // Check that app.use was called
    expect(app.use).toHaveBeenCalled();

    // Test the middleware function if it was captured
    if (capturedMiddleware) {
      const req = { path: '/' };
      const res = { locals: {} };
      const next = jest.fn();

      capturedMiddleware(req, res, next);

      expect(res.locals).toHaveProperty('appName');
      expect(res.locals).toHaveProperty('currentPage', 'home');
      expect(next).toHaveBeenCalled();
    }
  });
});
