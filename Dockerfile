FROM alpine
ENV FGVER 3.0.7
RUN apk add --update ca-certificates \
    && wget -qO- https://github.com/fiorix/freegeoip/releases/download/v$FGVER/freegeoip-$FGVER-linux-amd64.tar.gz | tar -xvz \
    && apk del ca-certificates \
    && rm -rf /var/cache/apk/* \
    && mv freegeoip-$FGVER-linux-amd64 /freegeoip
EXPOSE 8080
CMD ["/freegeoip/freegeoip","--silent"]
