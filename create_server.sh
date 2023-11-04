#!/bin/bash

# Valori predefiniti
defaultMySqlRootPassword="admin"
defaultMySqlUser="admin"
defaultMySqlPassword="admin"
defaultExternalPort="8000"
defaultInternalPort="80"

# Chiedi all'utente di inserire i valori desiderati o accetta i valori predefiniti
echo "Insert MYSQL_ROOT_PASSWORD [$defaultMySqlRootPassword]: "
read mySqlRootPassword
mySqlRootPassword=${mySqlRootPassword:-$defaultMySqlRootPassword}
echo "Inserted value: $mySqlRootPassword"

echo "Insert MYSQL_USER [$defaultMySqlUser]: "
read mySqlUser
mySqlUser=${mySqlUser:-$defaultMySqlUser}
echo "Inserted value: $mySqlUser"


echo "Insert MYSQL_PASSWORD [$defaultMySqlPassword]: "
read mySqlPassword
mySqlPassword=${mySqlPassword:-$defaultMySqlPassword}
echo "Inserted value: $mySqlPassword"


echo "Insert external port [$defaultExternalPort]: "
read externalPort
externalPort=${externalPort:-$defaultExternalPort}
echo "Inserted value: $externalPort"


echo "insert internal port [$defaultInternalPort]: "
read internalPort
internalPort=${internalPort:-$defaultInternalPort}
echo "Inserted value: $internalPort"


# Crea un file di configurazione esterno con i valori inseriti
cat > .env <<EOL
mySqlRootPassword=$mySqlRootPassword
mySqlUser=$mySqlUser
mySqlPassword=$mySqlPassword
externalPort=$externalPort
internalPort=$internalPort
EOL

# Esegui docker-compose utilizzando il file di configurazione esterno
docker-compose up -d

# Rimuovi il file di configurazione esterno
rm .env

# Wait for the server to start
echo "Waiting for the server to start..."
while ! curl -s http://localhost:$externalPort/installer.php -o /dev/null; do
  sleep 1
done

# Delete all files except .zip and installer.php
find . ! -name "*.zip" ! -name "installer.php" ! -name "dup-*.*" -type f -delete

# Determine the OS and open the installer.php page in the default web browser
case "$(uname -s)" in
  Linux*)  # Linux
    xdg-open "http://localhost:$externalPort/installer.php"
    ;;
  Darwin*)  # macOS
    open "http://localhost:$externalPort/installer.php"
    ;;
  *)
    echo "Unsupported operating system"
    ;;
esac

