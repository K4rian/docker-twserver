# Build the TiddlyWiki HTML file
FROM node:lts-alpine AS htmlbuilder

CMD ["/bin/sh"]

RUN mkdir /tw \
    && cd / \
    && npm install -g tiddlywiki \
    && tiddlywiki tw --init server \
    && tiddlywiki tw --build index


# Build the twserver binary
FROM golang:buster AS binbuilder

RUN go get github.com/k4rian/twserver-go \
    && go install -ldflags '-w -s' github.com/k4rian/twserver-go \
    && mkdir /twserv \
    && mv ${GOPATH}/bin/twserver-go /twserv/twserver \
    && chmod 755 /twserv/twserver


# Setup the Tiddly Wiki HTTP Server
FROM debian:buster-slim

LABEL maintainer="contact@k4rian.com"

ENV USERNAME tw
ENV USERHOME /home/$USERNAME

RUN set -x \
    && apt-get update \
    && useradd -m $USERNAME \
    && su $USERNAME -c "mkdir -p ${USERHOME}/www" \
    && apt-get clean autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=binbuilder --chown=tw /twserv/twserver /home/tw/twserver
COPY --from=htmlbuilder --chown=tw /tw/output/index.html /home/tw/www/index.html
# Docker >=18.09.0:
# COPY --from=binbuilder --chown=$USERNAME /twserv/twserver $USERHOME/twserver
# COPY --from=htmlbuilder --chown=$USERNAME /tw/output/index.html $USERHOME/www/index.html

USER $USERNAME
WORKDIR $USERHOME

ENTRYPOINT ["./twserver"]