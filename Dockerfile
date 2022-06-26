FROM golang:1.18-alpine as builder
WORKDIR /go/src/memberssite

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY main.go ./
RUN go build -o app .


FROM alpine:latest
WORKDIR /memberssite
COPY --from=builder /go/src/memberssite/app ./
CMD ["./app"]