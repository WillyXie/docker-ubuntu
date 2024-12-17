docker-ubuntu
===

## Introduction
This project aims to create an ubuntu system based on Docker as a base supporting development of other projects.

## Bring Up Docker Environment
I use docker to build an Ubuntu 24.04 environment for development, and the docker engine is running on Windows OS.<br />
You can follow these steps to bring it up, or just change corresponding commands to match your own machine if it's not Windows.

- CLI command
    ```bash
    $ docker build --build-arg BUILD_VER=$(Get-Date -Format "MM/dd/yyyy HH:mm K") -t ubuntu-vudu .
    $ docker run -v ${env:USERPROFILE}\.ssh:/root/.ssh:ro -v ${PSScriptRoot}\workspace:/home/user/workspace -p 3389:3389 --name vudu -td ubuntu-vudu /bin/bash
    $ docker exec -it vudu /bin/bash
    ```

- Pre-defined script for Windows
    ```shell=
    $ ./build.ps1
    $ ./start.ps1
    ```

## Hints
- XRDP

    The docker system has XRDP support, so you can connect to the localhost:3389 for GUI desktop. But you'll need to connect into it and start the XRDP service first.
    ```shell=
    $ docker exec -it vudu /bin/bash
    $ service xrdp start
    ```

- Directory mount point

    The example command and script for running container syncs `workspace` directory under project path to `/home/user/workspace` in container.