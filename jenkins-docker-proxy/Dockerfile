FROM alpine:latest

RUN apk update && apk add socat

VOLUME /var/run/docker.sock

EXPOSE 2375

ENTRYPOINT ["socat", "TCP-LISTEN:2375,reuseaddr,fork","UNIX-CLIENT:/var/run/docker.sock"]
