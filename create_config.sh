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

echo "Insert MYSQL_USER [$defaultMySqlUser]: "
read mySqlUser
mySqlUser=${mySqlUser:-$defaultMySqlUser}

echo "Insert MYSQL_PASSWORD [$defaultMySqlPassword]: "
read mySqlPassword
mySqlPassword=${mySqlPassword:-$defaultMySqlPassword}

echo "Insert external port [$defaultExternalPort]: "
read externalPort
externalPort=${externalPort:-$defaultExternalPort}

echo "insert internal port [$defaultInternalPort]: "
read internalPort
internalPort=${internalPort:-$defaultInternalPort}

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

