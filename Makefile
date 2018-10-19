VERSION=1.1

.PHONY: build run shell stop remove publish

build:
	docker build -t mwalters/wget-dl:$(VERSION) -t mwalters/wget-dl:latest .

# publish:
# 	docker push mwalters/wget-dl:$(VERSION)
# 	docker push mwalters/wget-dl:development
# 	docker push mwalters/wget-dl:latest

run:
	docker run --name wget-dl -d -v $(VERSION)/tmp/dl:/downloads mwalters/wget-dl -e PUID=0 -e PGID=12

shell:
	docker exec -ti wget-dl '/bin/ash'

stop:
	docker stop wget-dl

remove:
	docker rm wget-dl
