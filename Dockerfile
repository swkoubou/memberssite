FROM golang:1.18-alpine as builder
WORKDIR /go/src/app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY cmd ./cmd
COPY *.go ./

RUN go build -o app ./cmd/memberssite/main.go


FROM alpine:latest
WORKDIR /app
COPY --from=builder /go/src/app/app ./
CMD ["./app"]