#!/usr/bin/env ash

if [ -n "$PUID" ]; then usermod -u $PUID downloader && echo "PUID set to $PUID"; fi
if [ -n "$PUID" ]; then groupmod -g $PGID downloader && echo "PGID set to $PGID"; fi

env > /environment.sh
sed -i -e 's/^/export /' /environment.sh

su - downloader -c /dl.sh
