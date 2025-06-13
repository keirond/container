#!/bin/bash

set -e

SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

helm install cilium bitnami/cilium --version 3.0.2 \
-f "$SCRIPT_DIR/values.yaml" \
-n cilium --create-namespace