/**
 * TypeScript declaration for Express types
 */

declare namespace Express {
  interface Error {
    status?: number;
    statusCode?: number;
    stack?: string;
  }
}

export {};
