FROM golang:1.13.7-alpine3.11 as builder
WORKDIR /app
COPY . .
RUN go build -o cheung0825 main.go

FROM alpine:3.11
RUN apk add --update bash ca-certificates
WORKDIR /app
COPY --from=builder /app/cheung0825 .

ENTRYPOINT ["/app/cheung0825"]
