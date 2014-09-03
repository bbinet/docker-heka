FROM debian:wheezy

MAINTAINER Bruno Binet <bruno.binet@helioslite.com>

ADD https://github.com/mozilla-services/heka/releases/download/v0.7.1/heka_0.7.1_amd64.deb heka_0.7.1_amd64.deb
RUN dpkg -i heka_0.7.1_amd64.deb

VOLUME ["/config"]

EXPOSE 5565

CMD ["/usr/bin/hekad", "-config=/config/toml/"]
