# syntax=docker/dockerfile:1

FROM golang:1.17-alpine as builder
RUN apk --no-cache add ca-certificates git
WORKDIR /build

COPY go.mod go.sum ./
RUN go mod download

COPY . ./
RUN CGO_ENABLED=0 go build -o jtm_back

FROM alpine
WORKDIR /
COPY --from=builder /build/jtm_back .

EXPOSE 8080

CMD [ "./jtm_back", "--port", "8080" ]
