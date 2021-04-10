#!/bin/sh
#
# backup.sh
# =========
# Takes a backup of a given postgresql database, using the config
# passed in as the first argument to the script. Stores the backup in
# the directory passed as the second argument. Defaults to $HOME if no
# output directory is provided.
# Requires:
#   * yq
#   * pg_dump

CONFIG=$1
OUTPUT=$2

if [ -z "$CONFIG" ]; then
    echo "Needs a config file path as first argument"
    exit 1
fi

if [ -z "$OUTPUT" ]; then
    echo "Using default output directory $HOME"
    OUTPUT=$HOME
fi

USER=$(yq e '.database.write_user' $CONFIG)
HOST=$(yq e '.database.host' $CONFIG)
DB=$(yq e '.database.db' $CONFIG)

OUTPUT_FILE="$OUTPUT/$DB-$(date +%F).sql"

echo "Dumping $DB to $OUTPUT_FILE"

export PGPASSWORD=$(yq e '.database.pass' $CONFIG)
pg_dump -Fc -d $DB -h $HOST -U $USER > $OUTPUT_FILE

echo "Done!"
