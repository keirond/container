#.PHONY:

# ======================================

all: sonarqube elk cassandra

cmd: $(services)

# ======================================

confluent:
	podman-compose -f compse/confluent.yml -p confluent up -d

sonarqube:
	podman-compose -f compse/sonarqube.yml -p sonarqube up -d

elk:
	podman-compose -f compse/elk.yml -p elk up -d

cassandra:
	podman-compose -f compse/cassandra.yml -p cassandra up -d

mongodb:
	podman-compose -f compse/mongodb.yml -p mongodb up -d

keycloak:
	podman-compose -f compse/keycloak.yml -p keycloak up -d

# ======================================

confluent-down:
	podman-compose -f compse/confluent.yml -p confluent down

sonarqube-down:
	podman-compose -f compse/sonarqube.yml -p sonarqube down

elk-down:
	podman-compose -f compse/elk.yml -p elk down

cassandra-down:
	podman-compose -f compse/cassandra.yml -p cassandra down

mongodb-down:
	podman-compose -f compse/mongodb.yml -p mongodb down

keycloak-down:
	podman-compose -f compse/keycloak.yml -p keycloak down

# ======================================

services := $(filter-out $@,$(MAKECMDGOALS))

.DEFAULT_GOAL := cmd

# ======================================

