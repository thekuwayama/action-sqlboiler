FROM golang:1.12-alpine

ENV GO111MODULE=on

RUN apk --no-cache add git bash && \
    go get -u -t github.com/volatiletech/sqlboiler && \
    go get github.com/volatiletech/sqlboiler/drivers/sqlboiler-mysql

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
