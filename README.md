## Docker Logstash Image

[Logstash](https://www.elastic.co/products/logstash) is an open source, server-side data processing pipeline that ingests data from a multitude of sources simultaneously, transforms it, and then sends it to your favorite 「stash.」 (Ours is Elasticsearch, naturally.) . This Docker Logstash image to provide convenient way to test your log messages from console input (stdin), parse them via json codec and finally display them on console (stdout) as well.

### Logstash Version
* [5.5.2, latest (Dockerfile)](https://github.com/chhuang0123/docker_image_logstash/blob/master/5.5.2/Dockerfile)

### Features
* Support [console input] immediately(https://github.com/chhuang0123/docker_image_logstash/blob/master/5.5.2/opt/logstash/config/input.conf) (input.conf)
* Support [console output] for debugging (https://github.com/chhuang0123/docker_image_logstash/blob/master/5.5.2/opt/logstash/config/output.conf) (output.conf)
* Based on openjdk:8-jre-slim to make docker image smaller

### How to Run?

```
# interactive mode
$ docker run -it chhuang/docker_image_logstash:latest

```

When docker container is created. You could paste you log message on console and press ENTER key. It will parse your log message and output on console.

#### Run Example:
[![demo](https://asciinema.org/a/135398.png)](https://asciinema.org/a/135398?autoplay=1)

### How to use your configuration files?

```
$ docker run \
  -it -v /path/to/config_folder:/opt/logstash/config \
  chhuang/docker_image_logstash:latest
```

Or, you could customize it on your Dockerfile:

```
# Dockerfile
FROM chhuang/docker_image_logstash:latest
COPY /path/to/config_folder /conf.d

$ docker build -t namespace/repo .
$ docker run namespace/repo

```


### Reference:
* [Logstash configuration details](https://www.elastic.co/guide/en/logstash/current/configuration.html)
