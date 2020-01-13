FROM node:10-alpine
WORKDIR /go/src/ollikka.la/docker-go-example/
COPY . .
RUN npm i
RUN npx webpack --mode production --output-path='/srv/www/docker-go-example'

FROM golang:1.13.6-alpine
WORKDIR /go/src/ollikka.la/docker-go-example/
COPY . .
#COPY --from=0 /srv/www/docker-go-example /srv/www/docker-go-example
RUN go build -o ./docker-go-example cmd/docker-go-example/main.go && mkdir /usr/libexec/ && install docker-go-example /usr/libexec/

FROM bash
COPY --from=0 /srv/www/docker-go-example /srv/www/docker-go-example
COPY --from=1 /usr/libexec/docker-go-example /usr/libexec/docker-go-example
USER nobody
ENTRYPOINT /usr/libexec/docker-go-example --assets /srv/www/docker-go-example/ --port 8080
EXPOSE 8080



