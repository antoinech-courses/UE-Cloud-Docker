FROM golang:alpine

WORKDIR /app

VOLUME ["/logs"]

ENV LOG_FILE_LOCATION=/logs/app.log

COPY . .

RUN go build -o main .

EXPOSE 8080

CMD ["/app/main"]