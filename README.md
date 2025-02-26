# tp-dockerfile

The file `hello_server.go` contains the code of a server written in Go. 

Even if not being an expert in Go you should be able to understand that the server serves on port 8080 (internal port) and call a `handler` function when receiving a request.

The `handler` function simply get a name from the http request and print `Received request for name`. The message is returned and printed either in the prompt or in a `log` file.

The environment `LOG_FILE_LOCATION` indicates which log file to use if any.

To send a request to the service when deployed in a Docker container, you can simply do a `curl http://localhost:port\?name\=test` or use your internet browser directly, or Postman.

## Write a simple Dockerfile that deploys this go application

- take a look at the code
- write the Dockerfile
	- choose the appropriate Docker image for Go
	- create a working directory
	- copy what is needed inside the image
	- compile the Go file
	- expose the port of the application
	- start the application

To compile the application `go build -o main .`

TIPs: you need to expose ports in the Dockerfile and then you need to map the internal port with an external port running the container! See the `-p` option of `docker run`

## Write a Dockerfile with a volume to log application outputs

- understand the log part of the code
- add required environment variables in your Dockerfile 
- create a volume in the Dockerfile

TIPs: you need to declare a volume in the Dockerfile but also to match the volume with the host filesystem when running the container! See the `-v` option of `docker run`

## Write a Dockerfile with a multistage build

- name the base image as `builder`
- to build a static binary when compiling a Go program `CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .`
- use an alpine image for the multistage
- copy necessary content from `builder` with `--from=builder`
