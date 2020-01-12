run: clean
	@webpack --mode production
	@go build -o docker-go-example cmd/docker-go-example/main.go
	@chmod +x docker-go-example
	@./docker-go-example

clean:
	@rm -rf dist 2> /dev/null
	@rm -rf docker-go-example 2> /dev/null