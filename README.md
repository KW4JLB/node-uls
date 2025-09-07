# node-uls

````markdown
# Node ULS Explorer

## Description
A web application written in Node.js for querying the FCC Universal Licensing System. This application provides a user-friendly interface to explore and query the FCC's ULS database.

## Features
- Clean, responsive web interface
- Health monitoring endpoints
- Docker and Docker Compose support for easy deployment
- TypeScript for type safety
- Database integration with the FCC ULS schema
- Modular architecture with MVC pattern

## Features
- One off queries
- Pre-built reports
- Custom Report Generation (and saving)
- Scheduled Tasks

## Architecture
- MySQL Backend
- Dockerized Application
- docker-compose.yml for local execution

## Backend
- MySQL Docker container with persistent storage and an init script to build the Database tables.
- Database Schema can be found in `.ai/uls_sqlite_schema.md`

## Frontend
- Node.js web application
- Bootstrap
- Modern Look
- Configuration File for settings
- Packaged as a downloadable Docker Image with Symantec versioning

## Getting Started

### Prerequisites
- Docker and Docker Compose
- Node.js 20+ (for local development only)
- npm (for local development only)

### Quick Start with Docker
The easiest way to run the application is using Docker Compose, which will set up both the database and web application:

1. Make sure you have Docker and Docker Compose installed on your system
2. Clone this repository:
   ```bash
   git clone https://github.com/KW4JLB/node-uls.git
   cd node-uls
   ```
3. Start the application with Docker Compose:
   ```bash
   docker-compose up -d
   ```
4. Access the application at http://localhost:3000

### Database Bootstrap
The project includes a database bootstrapping feature that sets up a MySQL 9.4.0 database with the complete FCC ULS schema:

This will:
- Start a MySQL 9.4.0 container named "uls-db"
- Create the ULS database with all 67 tables from the FCC ULS schema
- Set up the required user accounts
- Mount the database storage at `.docker/mysql-data` for persistence

To verify the database setup, run the test script:
```bash
./test_db.sh
```

Database connection details:
- Host: localhost
- Port: 3306
- Database: uls
- User: uls_app_user
- Password: uls_secure_password

### Web Application
The Node.js web application is containerized and configured to:
- Run on port 3000
- Connect to the MySQL database
- Provide a web interface for querying the ULS database
- Include health check endpoints for monitoring

#### Health Check Endpoints
- `GET /api/ping`: Simple ping endpoint that returns "pong"
- `GET /api/health`: Detailed health information endpoint

## Local Development

### Setup Development Environment
1. Navigate to the application directory:
   ```bash
   cd node-uls/node-uls
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create a `.env` file for local development:
   ```bash
   PORT=3001
   NODE_ENV=development
   APP_NAME=ULS Explorer
   ```

4. Start the development server:
   ```bash
   npm run dev
   ```

5. Access the application at http://localhost:3001

### Project Structure
```
node-uls/
  ├── src/
  │   ├── config/           # Configuration files
  │   ├── controllers/      # Controller logic
  │   ├── middleware/       # Express middleware
  │   ├── public/           # Static assets
  │   ├── routes/           # API routes
  │   ├── services/         # Business logic
  │   ├── types/            # TypeScript type definitions
  │   ├── views/            # EJS templates
  │   ├── index.ts          # Main application entry point
  │   └── server.js         # Production server entry point
  ├── dist/                 # Compiled TypeScript output
  ├── logs/                 # Application logs
  ├── package.json          # Project dependencies
  ├── tsconfig.json         # TypeScript configuration
  └── Dockerfile            # Container definition
```

### Development Workflow
1. Make changes to the source code
2. Run the development server with `npm run dev` for automatic reloading
3. Write tests for new features in the `tests` directory
4. Run tests with `npm test`
5. Build the production version with `npm run build`

The database schema is initialized using the `init.sql` script, which creates all 67 tables defined in the FCC Universal Licensing System schema. This provides a complete local development environment that matches the production schema.
