#!/bin/bash
set -e

# Wait for the database to be ready
echo "Waiting for database..."
python3 manage.py check --database default
if [ $? -eq 0 ]; then
  echo "Database is ready!"
else
  echo "Database connection failed, retrying..."
  sleep 5
  # Try one more time
  python3 manage.py check --database default
fi

# Apply database migrations
echo "Applying database migrations..."
python3 manage.py migrate --noinput

# Collect static files
echo "Collecting static files..."
python3 manage.py collectstatic --noinput

# Start server
echo "Starting server..."
exec "$@"
