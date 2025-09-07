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

# Copy built application from build stage
COPY --from=build /app/dist ./dist
COPY --from=build /app/src/public ./dist/public

# Create logs directory
RUN mkdir -p logs

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Expose the port the app will run on
EXPOSE 3000

# Command to run the application
CMD ["node", "dist/index.js"]
