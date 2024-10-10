#.PHONY:

# ======================================

all: sonarqube elk cassandra

cmd: $(services)

# ======================================

confluent:
	podman-compose -f compose/confluent.yml -p confluent up -d

sonarqube:
	podman-compose -f compose/sonarqube.yml -p sonarqube up -d

elk:
	podman-compose -f compose/elk.yml -p elk up -d

cassandra:
	podman-compose -f compose/cassandra.yml -p cassandra up -d

mongodb:
	podman-compose -f compose/mongodb.yml -p mongodb up -d

keycloak:
	podman-compose -f compose/keycloak.yml -p keycloak up -d

nexus:
	podman-compose -f compose/neuxs.yml -p nexus up -d

# ======================================

confluent-down:
	podman-compose -f compose/confluent.yml -p confluent down

sonarqube-down:
	podman-compose -f compose/sonarqube.yml -p sonarqube down

elk-down:
	podman-compose -f compose/elk.yml -p elk down

cassandra-down:
	podman-compose -f compose/cassandra.yml -p cassandra down

mongodb-down:
	podman-compose -f compose/mongodb.yml -p mongodb down

keycloak-down:
	podman-compose -f compose/keycloak.yml -p keycloak down

nexus-down:
	podman-compose -f compose/neuxs.yml -p nexus down

# ======================================

services := $(filter-out $@,$(MAKECMDGOALS))

.DEFAULT_GOAL := cmd

# ======================================

