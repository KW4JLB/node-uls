# node-uls

## Description
Web based app- Create a MySQL 9.4.0 container named "uls-db"
- Create the ULS database with all 67 tables from the FCC ULS schema
- Set up the required user accounts
- Mount the database storage at `.docker/mysql-data` for persistencetion written in node.js for querying the FCC Universal Licensing System. 

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

### Database Bootstrap
The project includes a database bootstrapping feature that sets up a MySQL 9.4.0 database with the complete FCC ULS schema:

1. Make sure you have Docker and Docker Compose installed on your system
2. Run the following command to start the database:

```bash
docker-compose up -d
```

This will:
- Start a MySQL 9.4.0 container named "uls_db"
- Create the ULS database with all 67 tables from the FCC ULS schema
- Set up the required user accounts
- Mount the database storage at `.docker/mysql-data` for persistence

To verify the database setup, run the test script:

```bash
./test_db.sh
```

To connect to the database:
- Host: localhost
- Port: 3306
- Database: uls
- User: uls_app_user
- Password: uls_secure_password

The database schema is initialized using the `init.sql` script, which creates all 67 tables defined in the FCC Universal Licensing System schema. This provides a complete local development environment that matches the production schema.

