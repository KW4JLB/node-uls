/**
 * Integration tests for home routes
 */

const request = require('supertest');
const express = require('express');

// Mock the dependencies
jest.mock('../../src/controllers/homeController', () => ({
  getHomePage: (req, res) => res.send('Home Page'),
  getAboutPage: (req, res) => res.send('About Page')
}));

// Import the routes after mocking dependencies
const router = require('../../src/routes/index');

// Create a minimal express app for testing
const app = express();
app.use('/', router);

describe('Home Routes', () => {
  test('GET / should return 200 and home page content', async () => {
    const res = await request(app).get('/');

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe('Home Page');
  });

  test('GET /about should return 200 and about page content', async () => {
    const res = await request(app).get('/about');

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe('About Page');
  });
});
