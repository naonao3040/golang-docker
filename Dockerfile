# development
FROM golang:1.25-alpine AS development
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
RUN go install github.com/air-verse/air@latest
COPY . .
CMD ["air", "-c", ".air.toml"]

# build
FROM golang:1.25-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o main .

# production
FROM alpine:latest AS production
WORKDIR /root/
COPY --from=builder /app/main .
CMD ["./main"]
