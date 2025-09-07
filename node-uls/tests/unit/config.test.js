/**
 * Unit tests for config module
 */

describe('Config Module', () => {
  // Store the original environment variables
  const originalEnv = process.env;

  beforeEach(() => {
    // Reset the module registry before each test
    jest.resetModules();
    // Set up a clean environment before each test
    process.env = { ...originalEnv };
  });

  afterEach(() => {
    // Restore original environment variables
    process.env = originalEnv;
  });

  test('config should load values correctly', () => {
    // We'll test that the config module has the expected properties
    // without specifying exact values, which would depend on environment

    // Import the config module
    const config = require('../../src/config');

    // Check structure and types
    expect(config).toHaveProperty('server');
    expect(config.server).toHaveProperty('port');
    expect(config.server).toHaveProperty('nodeEnv');

    // Check that port is a number or string representing a number
    const portValue = config.server.port;
    expect(typeof portValue === 'number' || !isNaN(parseInt(portValue))).toBe(true);

    // Check that nodeEnv is a string
    expect(typeof config.server.nodeEnv).toBe('string');
  });
});
