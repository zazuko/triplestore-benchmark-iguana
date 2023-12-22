#!/bin/sh

# Make the script fail in case of issue
set -eu

mkdir -p results


docker compose up -d fuseki
sleep 10
./scripts/iguana.sh ./scenarios/simple.yaml
docker compose stop fuseki

exit 0
