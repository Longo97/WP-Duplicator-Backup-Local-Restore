#!/bin/bash

if [ ! -d "Projects" ]; then
  mkdir "Projects"
fi

cp Code/* "Projects/"

cd "Projects"

# Prompt the user to enter a name for the directory
echo -n "Enter a name for the directory: "
read directory

if [ ! -d "$directory" ]; then
  mkdir "$directory"
fi

# Copy .zip and installer.php files from the script directory to the project directory
cp *.sh *.yml "$directory"  > /dev/null 2>&1

# Change to the project directory
cd "$directory" || exit 1

source create_server.sh

echo "Now you can continue with a clean installation of your wordpress site"

cd ..

# Delete the files only required during installation
find . -maxdepth 1 -type f -exec rm {} \;
