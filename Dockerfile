FROM alpine:3.7
COPY start.sh dl.sh /

RUN apk --no-cache add shadow

RUN adduser -D downloader

VOLUME /downloads
ENTRYPOINT ["/start.sh"]
