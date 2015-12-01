FROM ubuntu:latest
MAINTAINER Raül Perez <repejota@gmail.com>
ENV HOME /root
WORKDIR /root
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
            ca-certificates \
            build-essential \
            autoconf \
            automake \
            make \
            mutt \
            git \
            vim-nox \
            lynx \
            curl \
            libev-dev && \
    apt-get build-dep mutt
ENV BROWSER lynx
RUN git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
RUN git clone https://github.com/magicmonty/bash-git-prompt.git ~/.config/bash-git-prompt
RUN mkdir -p $HOME/.mutt/cache/headers \
    $HOME/.mutt/cache/bodies \
    $HOME/.mutt/temp \
    && touch $HOME/.mutt/certificates
ENV LANG C.UTF-8
VOLUME /src
ADD bashrc $HOME/.bashrc
ADD muttrc $HOME/.muttrc
ADD tmux.conf $HOME/.tmux.conf
ADD mutt-colors.muttrc $HOME/.mutt-colors.muttrc
ADD mutt-raulperez-grn.muttrc $HOME/mutt-raulperez-grn.muttrc
COPY gitconfig $HOME/.gitconfig
CMD ["/bin/bash"]
