#!/bin/bash

keys=("1)" "2)")
descriptions=("Create a wordpress site from scratch" "Restore a Wordpress site from Duplicator Backup")

echo "Choose an option:"
for ((i=0; i<${#keys[@]}; i++)); do
    echo "${keys[$i + 1]} ${descriptions[$i + 1]}"
done

echo -n "Insert the number of your choice: "
read choice

if ((choice == 1)); then
    source wordpress_scratch.sh
elif ((choice == 2)); then
    source docker_wp_create.sh
else
    echo "Scelta non valida, riprova"
fi