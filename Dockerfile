FROM alpine:3.7
COPY dl.sh /
VOLUME /downloads
ENTRYPOINT ["/dl.sh"]
