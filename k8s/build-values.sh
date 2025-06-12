#!/bin/bash

set -e

SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
ENV_FILE="$SCRIPT_DIR/.env"

if [ -f "$ENV_FILE" ]; then
  set -o allexport
  source "$ENV_FILE"
  set +o allexport
else
  echo "Missing .env file: $ENV_FILE"
  exit 1
fi

# scan all templates under $SCRIPT_DIR
find "$SCRIPT_DIR" -type f -name "__values.tpl" | while read -r template; do
  output="${template%__values.tpl}values.yaml"
  echo "Generating $output"
  envsubst < "$template" > "$output"
done