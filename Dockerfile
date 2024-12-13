FROM ubuntu:24.04

WORKDIR /docker_workspace
RUN mkdir -p ~/workspace

RUN apt-get update
# XRDP install
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y lubuntu-desktop xrdp
# Some basic tools for development
RUN apt-get install -y build-essential curl fish git tmux vim

# Setup XRDP environment
RUN rm -f /run/reboot-required*
RUN adduser xrdp ssl-cert
RUN sed -i '3 a echo "\
export GNOME_SHELL_SESSION_MODE=Lubuntu\\n\
export XDG_SESSION_TYPE=x11\\n\
export XDG_CURRENT_DESKTOP=LXQT\\n\
export XDG_CONFIG_DIRS=/etc/xdg/xdg-Lubuntu:/etc/xdg\\n\
" > ~/.xsessionrc' /etc/xrdp/startwm.sh

EXPOSE 3389

# SSH key share
RUN mkdir -p /root/.ssh
RUN chmod -R 600 /root/.ssh/

# Build version track
# Force re-build steps below for up-to-date resource
ARG BUILD_VER UNSET
RUN echo $BUILD_VER > build_ver

# Install Vim plugin manager for users
RUN git clone https://github.com/WillyXie/cfg-setup.git
RUN chmod +x cfg-setup/setup.sh
RUN mkdir -p /etc/shadow-maint/useradd-post.d
RUN echo \
"#!/usr/bin/bash\n\
echo \"Post useradd script for \${SUBJECT}\n\"\n\
sudo -i -u \${SUBJECT} bash << EOF\n\
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\n\
cd /docker_workspace/cfg-setup/; chmod +x ./setup.sh; ./setup.sh\n\
EOF"\
> /etc/shadow-maint/useradd-post.d/useradd-post.sh
RUN chmod +x /etc/shadow-maint/useradd-post.d/useradd-post.sh

# Add an user here
RUN useradd -m user -p $(openssl passwd 1234)
RUN usermod -aG sudo user

# Default command during container start
CMD service xrdp start ; bash
