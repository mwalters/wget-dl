.PHONY: build run shell stop remove publish

build:
	docker build -t mwalters/wget-dl:local .

run:
	docker run --name wget-dl -d -v $(VERSION)/tmp/dl:/downloads mwalters/wget-dl -e PUID=0 -e PGID=12

shell:
	docker exec -ti wget-dl '/bin/ash'

stop:
	docker stop wget-dl

remove:
	docker rm wget-dl
