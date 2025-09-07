#!/bin/bash
# Test script to verify the MySQL database setup
# Part of bootstrap-db feature

echo "Testing MySQL database setup..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
  echo "Error: Docker is not running. Please start Docker and try again."
  exit 1
fi

# Check if uls-db container is running
if ! docker ps | grep -q uls-db; then
  echo "Error: MySQL container (uls-db) is not running."
  echo "Please start the container with: docker-compose up -d"
  exit 1
fi

echo "Testing connection to the ULS database..."
if ! docker exec uls-db mysql -u uls_app_user -puls_secure_password -e "SELECT 'Connection successful!' AS Status;"; then
  echo "❌ Error: Could not connect to the MySQL database."
  echo "Please check docker-compose.yml configuration and container logs."
  exit 1
fi

echo "Checking database tables..."
table_count=$(docker exec uls-db mysql -u uls_app_user -puls_secure_password -e "USE uls; SHOW TABLES;" | wc -l)
# Subtract 1 from table_count for the header row
table_count=$((table_count - 1))

echo "Found $table_count tables in the uls database."

# Show all tables
docker exec uls-db mysql -u uls_app_user -puls_secure_password -e "USE uls; SHOW TABLES;"

# Check if all expected tables exist
if [ "$table_count" -eq 94 ]; then
  echo "✅ Success: All 94 tables are properly created!"

  # Display a sample row count for a few key tables
  echo "Verifying table structure with sample counts:"
  docker exec uls-db mysql -u uls_app_user -puls_secure_password -e "USE uls; SELECT 'HD Table' as 'Table', COUNT(*) as 'Row Count' FROM HD UNION SELECT 'EN Table', COUNT(*) FROM EN UNION SELECT 'AM Table', COUNT(*) FROM AM;"

  # Check database connection from host
  echo "Testing database connection from host machine..."
  if command -v mysql &> /dev/null; then
    if mysql -h 127.0.0.1 -P 3306 -u uls_app_user -puls_secure_password -e "USE uls; SELECT 'Connected successfully!' as Message;"; then
      echo "✅ Database connection successful!"
    else
      echo "⚠️ Could not connect to database from host machine."
      echo "This is normal if you haven't exposed port 3306 in docker-compose.yml"
    fi
  else
    echo "⚠️ MySQL client not installed on host machine. Skipping connection test."
  fi

  exit 0
else
  echo "⚠️ Warning: Expected 94 tables but found $table_count tables."
  echo "Please check the init.sql script and database initialization."
fi
