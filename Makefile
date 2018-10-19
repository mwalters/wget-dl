.PHONY: build run shell stop test

build:
	@echo "Building image" && \
	docker build --rm -t mwalters/wget-dl:local .

run:
	docker run --rm --name wget-dl -d -e "PUID=1001" -e "PGID=1002" -v $(HOME)/tmp/dl:/downloads mwalters/wget-dl:local && docker logs -f wget-dl

shell:
	@docker exec -ti wget-dl '/bin/ash'

stop:
	@echo "Stopping container" && \
	docker stop wget-dl; true

test: stop build run
