FROM golang:1.16-alpine

ENV GO111MODULE=on

RUN apk --no-cache add git bash && \
    go get -u -t github.com/volatiletech/sqlboiler/v4 && \
    go get github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-mysql

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
