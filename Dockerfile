FROM ubuntu:22.04

WORKDIR /work

COPY ./src .

# Install basic tools
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y build-essential
RUN apt-get install -y fish
RUN apt-get install -y git vim tmux

# Vim plugin manager
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Tool config setup
RUN git clone https://github.com/WillyXie/cfg-setup.git
RUN cp cfg-setup/.vimrc ~/