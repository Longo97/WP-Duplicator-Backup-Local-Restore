#!/bin/bash

# Prompt the user to enter a name for the directory
echo -n "Enter a name for the directory: "
read directory

# Create a directory named "wordpress_docker" if it doesn't exist
if [ ! -d "$directory" ]; then
  mkdir "$directory"
fi

# Copy .zip and installer.php files from the script directory to the "wordpress_docker" directory
cp ./* "$directory"


# Change to the "wordpress_docker" directory
cd "$directory" || exit 1

# Run the docker-compose command
docker-compose up -d

# Wait for the server to start
echo "Waiting for the server to start..."
while ! curl -s http://localhost:8000/installer.php -o /dev/null; do
  sleep 1
done

# Delete all files except .zip and installer.php
find . ! -name "*.zip" ! -name "installer.php" -type f -delete

# Determine the OS and open the installer.php page in the default web browser
case "$(uname -s)" in
  Linux*)  # Linux
    xdg-open "http://localhost:8000/installer.php"
    ;;
  Darwin*)  # macOS
    open "http://localhost:8000/installer.php"
    ;;
  *)
    echo "Unsupported operating system"
    ;;
esac

echo "Now you can continue with a clean installation of the Duplicator backup"