FROM node:20-slim AS build

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci

# Copy source files and build the application
COPY . .
RUN npm run build

# Production stage
FROM node:20-slim AS production

WORKDIR /app

# Copy package files and install only production dependencies
COPY package*.json ./
RUN npm ci --omit=dev

# Install wget for health checks
RUN apt-get update && apt-get install -y wget && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy compiled TypeScript files
COPY --from=build /app/dist ./dist

# Create logs directory
RUN mkdir -p ./logs

# Copy JavaScript files that aren't processed by TypeScript
COPY --from=build /app/src/middleware ./dist/middleware
COPY --from=build /app/src/controllers ./dist/controllers
COPY --from=build /app/src/routes ./dist/routes
COPY --from=build /app/src/config ./dist/config

# Copy server.js entry point
COPY --from=build /app/src/server.js ./src/server.js

# Copy view templates and static files to dist directory
COPY --from=build /app/src/views ./dist/views
COPY --from=build /app/src/public ./dist/public

# Set environment variables and expose port in a single layer
ENV NODE_ENV=production \
    PORT=3000

# Expose the port the app will run on
EXPOSE 3000

# Define healthcheck to ensure container is functioning properly
HEALTHCHECK --interval=10s --timeout=5s --start-period=15s --retries=5 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/api/ping || exit 1

# Command to run the application
CMD ["node", "src/server.js"]
