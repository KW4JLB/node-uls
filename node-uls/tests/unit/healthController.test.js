/**
 * Unit tests for health controller
 */

const healthController = require('../../src/controllers/healthController');

describe('Health Controller', () => {
  test('getHealth should return a health status object', () => {
    // Mock Express req and res objects
    const req = {};
    const res = {
      json: jest.fn(),
    };

    // Call the getHealth function
    healthController.getHealth(req, res);

    // Check that res.json was called with an object containing the expected properties
    expect(res.json).toHaveBeenCalledTimes(1);

    const healthInfo = res.json.mock.calls[0][0];
    expect(healthInfo).toHaveProperty('status', 'UP');
    expect(healthInfo).toHaveProperty('timestamp');
    expect(healthInfo).toHaveProperty('uptime');
    expect(healthInfo).toHaveProperty('environment');
    expect(healthInfo).toHaveProperty('memory');

    // Verify memory object structure
    expect(healthInfo.memory).toHaveProperty('rss');
    expect(healthInfo.memory).toHaveProperty('heapTotal');
    expect(healthInfo.memory).toHaveProperty('heapUsed');
  });
});
