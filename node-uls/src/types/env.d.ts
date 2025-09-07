/**
 * TypeScript declaration for NodeJS process.env
 * This provides type safety for environment variables
 */

declare global {
  namespace NodeJS {
    interface ProcessEnv {
      PORT?: string;
      NODE_ENV: 'development' | 'production' | 'test';
      APP_NAME?: string;
    }
  }
}

// Export as a module
export {};
