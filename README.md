# docker-ubuntu

## Introduction
This project aims to create an ubuntu system based on Docker as a base supporting development of other projects.

## Quick Start
```bash
$ docker build -t ubuntu-basic .
$ docker run -p 3389:3389 --name basic -td ubuntu-basic /bin/bash
$ docker exec -it basic /bin/fish
```

## Hints
- XRDP
    Use `docker run` CLI command would override default command of dockerfile, you need to run `service xrdp start` manually.