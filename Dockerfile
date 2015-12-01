FROM debian:latest
MAINTAINER Raül Perez <repejota@gmail.com>
ENV LANG C.UTF-8
ENV HOME /root
WORKDIR /root
RUN apt-get update && \
    apt-get install -y ca-certificates vim-nox mutt links git
ENV BROWSER links
RUN git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
RUN git clone https://github.com/magicmonty/bash-git-prompt.git ~/.config/bash-git-prompt
RUN mkdir -p $HOME/.mutt/cache/headers $HOME/.mutt/cache/bodies $HOME/.mutt/temp && \
    touch $HOME/.mutt/certificates
RUN rm -f $HOME/.bashrc && ln -s /src/bashrc $HOME/.bashrc
RUN rm -f $HOME/.muttrc && ln -s /src/muttrc $HOME/.muttrc
RUN rm -f $HOME/.tmux.conf && ln -s /src/tmux.conf $HOME/.tmux.conf
RUN rm -f $HOME/.mutt-colors.muttrc && ln -s /src/mutt-colors.muttrc $HOME/.mutt-colors.muttrc
RUN rm -f $HOME/.mutt-raulperez-grn.muttrc && ln -s /src/mutt-raulperez-grn.muttrc $HOME/.mutt-raulperez-grn.muttrc
RUN rm -f $HOME/.gitconfig && ln -s /src/gitconfig $HOME/.gitconfig
VOLUME /src
CMD ["bash"]
