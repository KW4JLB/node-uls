/**
 * Unit tests for homeController
 */

const homeController = require('../../src/controllers/homeController');

describe('Home Controller', () => {
  test('getHomePage should render home page with correct data', () => {
    // Mock Express req and res objects
    const req = {};
    const res = {
      render: jest.fn(),
    };

    // Call the getHomePage function
    homeController.getHomePage(req, res);

    // Check that render was called with the correct view and data
    expect(res.render).toHaveBeenCalledTimes(1);
    expect(res.render).toHaveBeenCalledWith('pages/home', {
      title: 'Home',
      currentPage: 'home'
    });
  });

  test('getAboutPage should render about page with correct data', () => {
    // Mock Express req and res objects
    const req = {};
    const res = {
      render: jest.fn(),
    };

    // Call the getAboutPage function
    homeController.getAboutPage(req, res);

    // Check that render was called with the correct view and data
    expect(res.render).toHaveBeenCalledTimes(1);
    expect(res.render).toHaveBeenCalledWith('pages/about', {
      title: 'About',
      currentPage: 'about'
    });
  });
});
