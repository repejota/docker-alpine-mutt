FROM debian:latest
MAINTAINER Raül Perez <repejota@gmail.com>
ENV TERM screen-256color
ENV LANG C.UTF-8
ENV HOME /root
ENV SHELL /bin/bash
WORKDIR /root
RUN apt-get update && \
    apt-get install -y ca-certificates vim-nox mutt links git tmux
ENV BROWSER links
RUN git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
RUN git clone https://github.com/magicmonty/bash-git-prompt.git ~/.config/bash-git-prompt
RUN mkdir -p $HOME/.mutt/cache/headers $HOME/.mutt/cache/bodies $HOME/.mutt/temp && \
    touch $HOME/.mutt/certificates
RUN rm -f $HOME/.bashrc && ln -s /src/bashrc $HOME/.bashrc
RUN rm -f $HOME/.tmux.conf && ln -s /src/tmux.conf $HOME/.tmux.conf
RUN rm -f $HOME/.base.muttrc && ln -s /src/base.muttrc $HOME/.base.muttrc
RUN rm -f $HOME/.mutt-colors.muttrc && ln -s /src/mutt-colors.muttrc $HOME/.mutt-colors.muttrc
RUN rm -f $HOME/.mutt-raulperez-grn.muttrc && ln -s /src/mutt-raulperez-grn.muttrc $HOME/.mutt-raulperez-grn.muttrc
RUN rm -f $HOME/.mutt-repejota-gmail.muttrc && ln -s /src/mutt-repejota-gmail.muttrc $HOME/.mutt-repejota-gmail.muttrc
RUN rm -f $HOME/.gitconfig && ln -s /src/gitconfig $HOME/.gitconfig
VOLUME /src
CMD ["tmux", "-2"]
