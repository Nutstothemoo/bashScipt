#!/bin/bash

# Configuration de la base de données PostgreSQL
DB_USER="votre_utilisateur"
DB_NAME="votre_base_de_donnees"
DB_HOST="localhost"
DB_PORT="5432"

# Répertoire de sauvegarde
BACKUP_DIR="/chemin/vers/votre/repertoire/de/sauvegarde"

# Nom du fichier de sauvegarde
BACKUP_FILE="backup_$(date +%Y%m%d%H%M%S).sql"

# Commande pg_dump pour effectuer la sauvegarde
pg_dump -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -F p -f "$BACKUP_DIR/$BACKUP_FILE"

# Vérification si la sauvegarde a réussi
if [ $? -eq 0 ]; then
  echo "Sauvegarde de la base de données $DB_NAME effectuée avec succès."
else
  echo "Erreur lors de la sauvegarde de la base de données $DB_NAME."
fi
