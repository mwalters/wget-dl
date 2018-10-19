### Purpose

This will download a series of files placed in a file called `urls.txt` (located in the volume mounted in the container).

Place urls in `urls.txt` (1 URL per line) in the volume you mount in the container.  If the file does not exist when the container is started, it will be created.  As the files are downloaded, they will be removed from the file.

There is a pause of 30 seconds between downloads.  Once all URLs from the file have been downloaded, it is checked every 30 seconds to see if new URLs have been added.

Any downloads that fail will be added to a file called `failed_urls.txt` in the downloads volume (it will be created if needed).

Usage:

```
docker run -d \
--name wget-dl \
-v /path/to/your/downloads:/downloads \
-e PUID=<PUID>
-e PGID=<GID>
mwalters/wget-dl:latest
```

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. This is avoided by allowing you to specify the user `PUID` and group `PGID`. Below is an example of how to find out the user id and group ID for the user specified.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

### Tagging / Releases

* `stable` tag should be latest stable release
* `development` tag may be unstable
* Numbered tags can be used to pin to a specific release if desired

### Links

* [View on github](https://github.com/mwalters/wget-dl)
* [View on dockerhub](https://hub.docker.com/r/mwalters/wget-dl/)
