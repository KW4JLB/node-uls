/**
 * Integration tests for health routes
 */

const request = require('supertest');
const express = require('express');
const healthRoutes = require('../../src/routes/health');

// Create a minimal express app for testing
const app = express();
app.use('/api', healthRoutes);

describe('Health Routes', () => {
  test('GET /api/ping should return 200 and "pong"', async () => {
    const res = await request(app).get('/api/ping');

    expect(res.statusCode).toBe(200);
    expect(res.text).toBe('pong');
  });

  test('GET /api/health should return 200 and health info object', async () => {
    const res = await request(app).get('/api/health');

    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveProperty('status', 'UP');
    expect(res.body).toHaveProperty('timestamp');
    expect(res.body).toHaveProperty('uptime');
    expect(res.body).toHaveProperty('environment');
    expect(res.body).toHaveProperty('memory');
  });
});
