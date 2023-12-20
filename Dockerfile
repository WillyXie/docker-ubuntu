FROM ubuntu:22.04

WORKDIR /work

COPY ./source .

# Get environment ready
RUN apt-get update
RUN apt-get install -y build-essential

# Install developing tools
RUN apt-get install -y fish
RUN apt-get install -y git vim tmux
