.PHONY: up down create destroy all

# provision infra
create:
	./scripts/create_infra.sh

# destroy infra
destroy:
	./scripts/delete_infra.sh

# bring up test containers
up:
	docker-compose -f local_test_env/docker-compose.yml up -d

# bring down the containers
down-only:
	docker-compose -f local_test_env/docker-compose.yml down

# Run all or specific commands
all:
	$(MAKE) up
	./scripts/all.sh

# destroy whole thing
down:
	$(MAKE) destroy
	$(MAKE) down-only

