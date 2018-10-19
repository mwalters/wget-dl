FROM alpine:3.7
COPY dl.sh /

RUN apk --no-cache add shadow

RUN adduser -D downloader

USER downloader

VOLUME /downloads
ENTRYPOINT ["/dl.sh"]
