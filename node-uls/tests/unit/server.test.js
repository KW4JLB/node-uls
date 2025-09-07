/**
 * Unit test for server.js
 */

describe('server.js', () => {
  beforeEach(() => {
    // Reset modules before each test
    jest.resetModules();
    // Mock the index module
    jest.mock('../../dist/index', () => {
      return {};
    }, { virtual: true });
  });

  test('server.js should have the correct structure', () => {
    // Read the file content to check structure without executing it
    const fs = require('fs');
    const path = require('path');
    const serverFilePath = path.resolve(__dirname, '../../src/server.js');

    // Check if the file exists
    expect(fs.existsSync(serverFilePath)).toBe(true);

    // Read the file content
    const content = fs.readFileSync(serverFilePath, 'utf8');

    // Check that the content includes a require statement for dist/index
    expect(content).toMatch(/require\(['"]\.\.\/(dist|dist\/index)['"]\)/);

    // Check that it has the production server comment
    expect(content).toMatch(/Production server entry point/);
  });
});
