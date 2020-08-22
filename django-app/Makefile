all:
	docker build . --tag=webapp
	docker-compose up

stop:
	docker-compose down

restart:
	docker-compose down
	docker build . --tag=webapp
	docker-compose up