#!/bin/bash

# Check if an argument (directory path) is provided
if [ -z "$1" ]; then
  echo "Error: You need to provide the directory path as an argument."
  return 1
fi

# Assign the argument to a variable
folder="$1"

# Specify the name of the .zip file to look for
zip_file=".zip"
installer_file="installer.php"


# Check if the .zip file exists in the folder
if [ "$(find "$folder" -maxdepth 1 -type f -name "*$extension" | wc -l)" -gt 0 ]; then
  
else
  echo "The Duplicator backup file is not present in the folder. The script will exit."
  return 1  # Exit the script with exit code 1 (indicating an error)
fi

# Check if the installer.php file exists in the folder
if [ -e "$folder/$installer_file" ]; then
  
else
  echo "The installer.php file is not present in the folder or it has a different name. Please correct it. The script will exit."
  return 1  # Exit the script with exit code 1 (indicating an error)
fi
