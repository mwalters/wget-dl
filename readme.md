### Purpose

This will download a series of files placed in a file called `urls.txt` (located in the volume mounted in the container).

Place urls in `urls.txt` (1 URL per line - see below for example) in the volume you mount in the container.  If the file does not exist when the container is started, it will be created.  As the files are downloaded, they will be removed from the file.  The files will be downloaded in the order they are placed in the file (top first).

There is a pause of 30 seconds, by default, between downloads.  This pause is configurable using environment variables.  Once all URLs from the file have been downloaded, it is checked at the pause interval to see if new URLs have been added.

Any downloads that fail will be added to a file called `failed_urls.txt` in the downloads volume (it will be created if needed).

---
### Usage

```shell
docker run -d \
--name wget-dl \
-v /path/to/your/downloads:/downloads \
-e PUID=<PUID> \
-e PGID=<GID> \
-e PAUSE=<PAUSE_INTERVAL> \
mwalters/wget-dl:stable
```
---
### Parameters
* `-v /path/to/your/downloads` - Path on the host where downloads and the text files mentioned above should be stored
* `-e PUID` - For User ID; see explanation below
* `-e PGID` - For Group ID; see explanation below
* `-e PAUSE` - The number of seconds to pause between downloading files (Integer)
---
### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. This is avoided by allowing you to specify the user `PUID` and group `PGID`. Below is an example of how to find out the user id and group ID for the user specified.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id <username>` as below:

```shell
  $ id <username>
    uid=1001(username) gid=1001(usergroupname) groups=1001(usergroupname)
```
---
### Example urls.txt
```text
https://www.somesite.com/download1.png
https://www.anothersite.com/download2.png
https://www.thirdsite.com/download3.png
```
---
### Tagging / Releases

* `stable` tag should be latest stable release
* `latest` is a mirror of `stable` (weird convention, amirite?  `stable` tag is preferred)
* `development` tag may be unstable, but is the actual latest build
* Numbered tags can be used to pin to a specific release if desired
---
### Versioning
[Semantic versioning](https://semver.org/) is used.  Basically, given a version of `x.y.z`

* `x` = New features added with breaking changes (i.e. you'll need to do something different to use this new version)
* `y` = Adds functionality in a backwards-compatible manner (i.e. you shouldn't need to do anything different, but have new features available to you if you want to use them)
* `z` = Small fixes that include non-breaking changes (i.e. something was fixed that should have worked but wasn't, nothing new)
---
### Links

* [View on github](https://github.com/mwalters/wget-dl)
* [View on dockerhub](https://hub.docker.com/r/mwalters/wget-dl/)
* [Contibute](https://github.com/mwalters/wget-dl/wiki/contributing) to the development of this image
