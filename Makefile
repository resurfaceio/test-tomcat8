PROJECT_NAME=tomcat8

start:
	@docker stop resurface || true
	@docker build -t test-tomcat8 --no-cache .
	@docker-compose up --detach

stop:
	@docker-compose stop
	@docker-compose down --volumes --remove-orphans
	@docker image rmi -f test-tomcat8

bash:
	@docker exec -it tomcat8 bash

logs:
	@docker logs -f tomcat8

ping:
	@curl "http://localhost"

restart:
	@docker-compose stop
	@docker-compose up --detach

test:
	@docker exec -it tomcat8 python3 test.py