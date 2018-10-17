.PHONY: build run shell stop remove publish

build:
	docker build -t mwalters/wget-dl:1.0 -t mwalters/wget-dl:latest .

publish:
	docker push mwalters/wget-dl:1.0
	docker push mwalters/wget-dl:latest

run:
	docker run --name wget-dl -d -v /Users/matthewwalters/tmp/dl:/downloads mwalters/wget-dl

shell:
	docker exec -ti wget-dl '/bin/ash'

stop:
	docker stop wget-dl

remove:
	docker rm wget-dl
