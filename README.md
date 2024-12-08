# docker-ubuntu

## Introduction
This project aims to create an ubuntu system based on Docker as a base supporting development of other projects.

## Quick Start
```bash
$ docker build -t devenv .
$ docker run --name devenv -td devenv /bin/fish
$ docker exec -it devenv /bin/fish
```
