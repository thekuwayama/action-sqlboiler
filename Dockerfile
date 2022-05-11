FROM golang:1.16-alpine

ENV GO111MODULE=on
ARG SQLBOILER_VERSION="v4.5.0"

RUN apk --no-cache add git bash && \
    go install github.com/volatiletech/sqlboiler/v4@${SQLBOILER_VERSION} && \
    go install github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-mysql@${SQLBOILER_VERSION}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
