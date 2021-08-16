FROM golang:alpine as builder

WORKDIR /usr/src/app

COPY main.go .

RUN go build -ldflags -"w" main.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/main .

CMD [ "./main" ]