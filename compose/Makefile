#.PHONY: sonarqube-up sonarqube-down elk-up elk-down

# ======================================

all: sonarqube elk cassandra

cmd: $(services)

# ======================================

confluent:
	podman-compose -f confluent.yml -p confluent up -d

sonarqube:
	podman-compose -f sonarqube.yml -p sonarqube up -d

elk:
	podman-compose -f elk.yml -p elk up -d

cassandra:
	podman-compose -f cassandra.yml -p cassandra up -d

mongodb:
	podman-compose -f mongodb.yml -p mongodb up -d

# ======================================

confluent-down:
	podman-compose -f confluent.yml -p confluent down

sonarqube-down:
	podman-compose -f sonarqube.yml -p sonarqube down

elk-down:
	podman-compose -f elk.yml -p elk down

cassandra-down:
	podman-compose -f cassandra.yml -p cassandra down

mongodb-down:
	podman-compose -f mongodb.yml -p mongodb down
# ======================================

services := $(filter-out $@,$(MAKECMDGOALS))

.DEFAULT_GOAL := cmd

# ======================================

