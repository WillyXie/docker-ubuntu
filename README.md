docker-ubuntu
===

## Introduction
This project aims to create an ubuntu system based on Docker as a base supporting development of other projects.

## Bring Up Docker Environment
I use docker to build an Ubuntu 24.04 environment for development, and the docker engine is running on Windows OS.<br />
You can follow these steps to bring it up, or just change corresponding commands to match your own machine if it's not Windows.

- CLI commands
    ```bash
    $ docker build -t ubuntu-basic .
    $ docker run -v ${env:USERPROFILE}\.ssh:/root/.ssh:ro -v ${PSScriptRoot}\work:/work -p 3389:3389 --name basic -td ubuntu-basic /bin/bash
    $ docker exec -it basic /bin/bash
    ```

- Pre-defined script for Windows
    ```shell=
    $ ./build.ps1
    $ ./start.ps1
    ```

## Hints
The docker system has XRDP support, so you can connect to the localhost:3389 for GUI desktop. But you'll need to connect into it and start the XRDP service first.
```shell=
$ docker exec -it basic /bin/bash
$ service xrdp start
```
