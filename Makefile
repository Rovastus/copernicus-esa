build:
	docker-compose -f docker-compose.yml build

run:
	docker-compose -f docker-compose.yml run copernicus-esa /bin/bash

destroy:
	docker-compose -f docker-compose.yml kill; docker-compose -f docker-compose.yml rm -f ; docker volume rm $(docker volume ls -f dangling=true -q) 2> /dev/null || true

