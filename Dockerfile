FROM golang:alpine as builder

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]