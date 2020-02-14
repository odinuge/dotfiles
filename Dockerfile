FROM alpine

ARG TARGETPLATFORM
ARG BUILDPLATFORM

WORKDIR /root
COPY . dotfiles

ENV IS_DOCKER="true"
RUN apk add curl bash make vim zsh tmux git stow zsh-vcs --no-cache && cd dotfiles && NO_COC=true make zsh vim tmux gitconfig
RUN echo "export NO_COC=true" >> /root/.zshrc_priv

ENTRYPOINT ["zsh"]
