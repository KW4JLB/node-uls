/**
 * Production server entry point
 */

// This file is a direct JavaScript entry point for production
// to avoid issues with TypeScript compilation in Docker

// Simply require the main application file
require('../dist/index');
