FROM ubuntu:22.04

WORKDIR /work

# Install basic tools
RUN apt-get update
RUN apt-get install -y build-essential curl fish git tmux vim

# Vim plugin manager
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Tool config setup
RUN git clone https://github.com/WillyXie/cfg-setup.git
RUN cd cfg-setup/; chmod +x ./setup.sh; ./setup.sh