FROM debian:jessie
ENV FGVER 3.0.5
ADD https://github.com/fiorix/freegeoip/releases/download/v$FGVER/freegeoip-$FGVER-linux-amd64.tar.gz /download/
RUN cd /download && gunzip *.tar.gz && tar xf *.tar && mv freegeoip-$FGVER-linux-amd64 /freegeoip
EXPOSE 8080
CMD ["/freegeoip/freegeoip","--silent"]
