#.PHONY:

# ======================================

up-all: confluent sonarqube elk cassandra mongodb postgres keycloak nexus
down-all: confluent-down sonarqube-down elk-down cassandra-down mongodb-down postgres-down keycloak-down nexus-down

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

postgres:
	podman-compose -f compose/postgres.yml -p postgres up -d

keycloak:
	podman-compose -f compose/keycloak.yml -p keycloak up -d

nexus:
	podman-compose -f compose/nexus.yml -p nexus up -d

redis:
	podman-compose -f compose/redis.yml -p redis up -d

monitoring:
	podman-compose -f compose/monitoring.yml -p monitoring up -d

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

postgres-down:
	podman-compose -f compose/postgres.yml -p postgres down

keycloak-down:
	podman-compose -f compose/keycloak.yml -p keycloak down

nexus-down:
	podman-compose -f compose/nexus.yml -p nexus down

redis-down:
	podman-compose -f compose/redis.yml -p redis down

monitoring-down:
	podman-compose -f compose/monitoring.yml -p monitoring down

# ======================================

services := $(filter-out $@,$(MAKECMDGOALS))

.DEFAULT_GOAL := cmd

# ======================================

