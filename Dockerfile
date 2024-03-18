# Build the TiddlyWiki HTML file
FROM node:lts-alpine AS htmlbuilder

CMD ["/bin/sh"]

RUN mkdir /tw \
    && cd / \
    && npm install -g tiddlywiki \
    && tiddlywiki tw --init server \
    && tiddlywiki tw --build index

# Build the twserver binary
FROM golang:alpine AS binbuilder

RUN go install -ldflags '-w -s' github.com/K4rian/twserver-go@latest \
    && mkdir /twserv \
    && mv ${GOPATH}/bin/twserver-go /twserv/twserver \
    && chmod +x /twserv/twserver

# Setup the Tiddly Wiki HTTP Server
FROM alpine:latest

ENV USERNAME tw
ENV USERHOME /home/$USERNAME

RUN apk update \
    && adduser --disabled-password $USERNAME \
    && su $USERNAME -c "mkdir -p ${USERHOME}/www" \
    && rm -rf /tmp/* /var/tmp/*

COPY --from=binbuilder --chown=$USERNAME /twserv/twserver $USERHOME/twserver
COPY --from=htmlbuilder --chown=$USERNAME /tw/output/index.html $USERHOME/www/index.html

USER $USERNAME
WORKDIR $USERHOME

ENTRYPOINT ["./twserver"]