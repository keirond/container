#!/bin/bash
set -e

# Usage: ./docker-compose.sh <compose-file> <up|down> [additional args]

compose_file="$1"
action="$2"
shift 2

if [[ -z "$compose_file" || -z "$action" ]]; then
	echo "Usage: $0 <compose-file> <up|down> [additional args]"
	exit 1
fi

if [[ "$action" == "up" ]]; then
	docker compose -f "$compose_file" up -d --build --force-recreate "$@"
elif [[ "$action" == "down" ]]; then
	docker compose -f "$compose_file" down "$@"
else
	echo "Action must be 'up' or 'down'"
	exit 1
fi
