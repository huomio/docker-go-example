FROM node:10
WORKDIR /go/src/ollikka.la/docker-go-example/
COPY . .
RUN npm i
RUN npx webpack --mode production --output-path='/srv/www/docker-go-example'

FROM golang:latest
WORKDIR /go/src/ollikka.la/docker-go-example/
COPY . .
COPY --from=0 /srv/www/docker-go-example /srv/www/docker-go-example

RUN go build -o ./docker-go-example cmd/docker-go-example/main.go && mkdir /usr/libexec/ && install docker-go-example /usr/libexec/
CMD /usr/libexec/docker-go-example --assets /srv/www/docker-go-example/
EXPOSE 80



