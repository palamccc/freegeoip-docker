FROM alpine
ENV FGVER 3.1.4
RUN apk add --no-cache ca-certificates curl \
    && curl -L https://github.com/fiorix/freegeoip/releases/download/v$FGVER/freegeoip-$FGVER-linux-amd64.tar.gz | tar -xvz \
    && apk del ca-certificates curl \
    && mv freegeoip-$FGVER-linux-amd64 /freegeoip
EXPOSE 8080
CMD ["/freegeoip/freegeoip","--silent"]
