/**
 * Unit tests for logger middleware
 */

const { requestLogger, logger } = require('../../src/middleware/logger');

describe('Logger Middleware', () => {
  test('logger should have all required methods', () => {
    expect(logger).toHaveProperty('info');
    expect(logger).toHaveProperty('error');
    expect(logger).toHaveProperty('warn');
    expect(logger).toHaveProperty('debug');

    expect(typeof logger.info).toBe('function');
    expect(typeof logger.error).toBe('function');
    expect(typeof logger.warn).toBe('function');
    expect(typeof logger.debug).toBe('function');
  });

  test('requestLogger should be a function', () => {
    expect(typeof requestLogger).toBe('function');
  });

  test('requestLogger should call next', () => {
    // Mock Express req, res, and next objects
    const req = {
      method: 'GET',
      path: '/test',
      originalUrl: '/test'
    };
    const res = {
      on: jest.fn((event, callback) => {
        if (event === 'finish') {
          callback();
        }
      }),
      statusCode: 200
    };
    const next = jest.fn();

    // Call the requestLogger middleware
    requestLogger(req, res, next);

    // Check that next was called
    expect(next).toHaveBeenCalled();
    // Check that res.on was called with 'finish'
    expect(res.on).toHaveBeenCalledWith('finish', expect.any(Function));
  });
});
