FROM alpine:3.6
MAINTAINER Ben Faul, https://github.com/benmfaul
RUN apk --update add openjdk8-jre
RUN apk add --no-cache bash
RUN apk add --no-cache nss
RUN apk add --no-cache python && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    pip install --upgrade pip requests && \
    rm -r /root/.cache

RUN mkdir target
RUN mkdir tools
RUN mkdir shell
RUN mkdir libs
RUN mkdir query
RUN mkdir python
RUN mkdir logs

COPY log4j.properties /

COPY query/daily.json    /query
COPY query/lastlog.json  /query
COPY query/total.json   /query
COPY target/*with-dependencies.jar /target
COPY wait-for-it.sh /
COPY tools/* /
COPY libs/* /libs
COPY shell/* /shell/
COPY config.json config.json
COPY python/* /python/

EXPOSE 8100 7002

CMD ./crosstalk
