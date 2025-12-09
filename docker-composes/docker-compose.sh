#!/bin/bash
set -e

# Usage: ./docker-compose.sh <compose-file> <up|down> [additional args]

COMPOSE_FILE="$1"
ACTION="$2"
shift 2

if [[ -z "$COMPOSE_FILE" || -z "$ACTION" ]]; then
	echo "Usage: $0 <compose-file> <up|down> [additional args]"
	exit 1
fi

if [[ "$ACTION" == "up" ]]; then
	docker compose -f "$COMPOSE_FILE" up -d --build --force-recreate "$@"
elif [[ "$ACTION" == "down" ]]; then
	docker compose -f "$COMPOSE_FILE" down "$@"
else
	echo "Action must be 'up' or 'down'"
	exit 1
fi
