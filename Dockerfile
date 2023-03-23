# Builder
FROM golang:alpine3.17 as builder
WORKDIR /app
COPY main.go .
RUN go build -o main ./main.go

# Runner
FROM scratch
WORKDIR /app
COPY --from=builder /app/main .
ENTRYPOINT ["./main"]
