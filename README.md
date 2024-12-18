docker-ubuntu
===

## Introduction
This project aims to create an ubuntu system based on Docker as a base supporting development of other projects.

## Bring Up Docker Environment
I use docker to build an Ubuntu 24.04 environment for development, and the docker engine is running on Windows OS.<br />
You can follow these steps to bring it up, or just change corresponding commands to match your own machine if it's not Windows.

- CLI command
    ```bash
    $ docker build --build-arg BUILD_VER=$(Get-Date -Format "MM/dd/yyyy HH:mm K") -t ubuntu-basic .
    $ docker run -v ${env:USERPROFILE}\.ssh:/root/.ssh:ro -v ${PSScriptRoot}\sync:/home/user/sync -v volume-basic:/home/user/workspace -p 3389:3389 --name basic -td ubuntu-basic /bin/fish
    $ docker exec -it basic /bin/fish
    ```

- Pre-defined script for Windows
    ```shell=
    $ ./build.ps1
    $ ./start.ps1
    $ ./connect.ps1
    ```

## Hints
- XRDP

    The docker system has XRDP support, so you can connect to the localhost:3389 for GUI desktop. But you'll need to connect into it and start the XRDP service first.
    ```shell=
    $ docker exec -it basic /bin/fish
    $ service xrdp start
    ```

- Directory mount point

    The example command and script for running container syncs `sync` directory under project path to `/home/user/sync` in container. User can use it to sync files between host & container.

    Another mount point is docker volume `volume-basic` to `/home/user/workspace`, it's managed by docker engine to avoid slow response time for file access when the size becomes too big.