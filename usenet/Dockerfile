FROM alpine:latest

RUN apk add bash
RUN apk add nano
RUN apk add shadow
RUN apk add tin

ENV EDITOR=nano
ENV NNTPSERVER=usenet.dedis.ch
ENV NTTPPORT=119

WORKDIR /root/
