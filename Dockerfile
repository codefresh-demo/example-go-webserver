FROM golang:1.8-alpine AS builder

WORKDIR /myapp

COPY . .
RUN go build -o app

FROM alpine

COPY --from=builder /myapp /myapp 

WORKDIR /myapp
EXPOSE 8080

ENTRYPOINT ["./app"]
