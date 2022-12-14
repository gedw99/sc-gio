# Source: https://gist.github.com/54b5994500501789ceac715486977901

#######################################################
# How To Inspect, Plan, Migrate DB Schemas With Atlas #
# https://youtu.be/JLvHpXJ1hHk                        #
#######################################################

# Additional Info:
# - Atlas: https://atlasgo.io
# - SchemaHero - Database Schema Migrations Inside Kubernetes: https://youtu.be/SofQxb4CDQQ

REPO_NAME=atlas-demo

dep-git:
	git clone https://github.com/vfarcic/atlas-demo
	@echo $(REPO_NAME) >> ,gitignore

dep-tools:
	# https://atlasgo.io/getting-started/
	brew install ariga/tap/atlas

# You can skip the command that follows if you already have a
#   PostgreSQL DB running.
# If you do skip it, you might need to change the addresses in
#    the rest of the commands.

# Make sure that Docker is running
docker-up:
	docker container run --name my-db \
    	--publish 5432:5432 --env POSTGRES_PASSWORD=admin \
    	--detach postgres

docker-del:
	docker container rm my-db --force

db-create:
	docker exec -it my-db psql -U postgres

	CREATE DATABASE demo;

	\connect demo

	CREATE TABLE videos (
	id text PRIMARY KEY,
	title text NOT NULL
	);

	exit

# Install `atlas` CLI from https://atlasgo.io/getting-started/

##############################################
# Declarative Database Migrations With Atlas #
##############################################

atlas-run:
	atlas schema inspect \
    	--url "postgres://postgres:admin@localhost:5432/demo?sslmode=disable" \
    	| tee schema.hcl

	diff schema.hcl schema-comments.hcl

	atlas schema apply \
    	--url "postgres://postgres:admin@localhost:5432/demo?sslmode=disable" \
    	--file schema-comments.hcl --dry-run

	atlas schema apply \
    	--url "postgres://postgres:admin@localhost:5432/demo?sslmode=disable" \
    	--file schema-comments.hcl --auto-approve

	# Comment a column

	atlas schema apply \
    	--url "postgres://postgres:admin@localhost:5432/demo?sslmode=disable" \
    	--file schema-comments.hcl

	# Comment the column

	atlas schema apply \
    	--url "postgres://postgres:admin@localhost:5432/demo?sslmode=disable" \
    	--file schema-comments.hcl --auto-approve

