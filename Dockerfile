FROM ubuntu:24.04

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

# RDP
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y lubuntu-desktop
RUN rm -f /run/reboot-required*

RUN useradd -m user -p $(openssl passwd 1234)
RUN usermod -aG sudo user

RUN apt-get install -y xrdp
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
RUN chmod 600 /root/.ssh/id_rsa

CMD service xrdp start ; bash
