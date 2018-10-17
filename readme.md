[View on github](https://github.com/mwalters/wget-dl)

This will download a series of files placed in a file called `urls.txt` (located in the volume mounted in the container).

Place urls in `urls.txt` (1 URL per line) in the volume you mount in the container.  If the file does not exist when the container is started, it will be created.  As the files are downloaded, they will be removed from the file.

There is a pause of 30 seconds between downloads.  Once all URLs from the file have been downloaded, it is checked every 30 seconds to see if new URLs have been added.

Any downloads that fail will be added to a file called `failed_urls.txt` in the downloads volume (it will be created if needed).

Usage:

```
docker run -d \
--name wget-dl \
-v /Users/matthewwalters/tmp/dl:/downloads \
mwalters/wget-dl:latest
```
