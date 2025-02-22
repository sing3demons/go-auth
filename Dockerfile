FROM golang:alpine

RUN mkdir /app

WORKDIR /app

ADD go.mod .
ADD go.sum .

RUN go mod download
ADD . .

RUN go get github.com/githubnemo/CompileDaemon

EXPOSE ${PORT}

ENTRYPOINT CompileDaemon --build="go build -o tmp/main_test" --command=./tmp/main_test
