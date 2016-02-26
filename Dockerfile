FROM debian:jessie

MAINTAINER Bruno Binet <bruno.binet@helioslite.com>

ENV HEKA_VERSION 0.10.0
ENV HEKA_MD5 8dc72f5be664ef1659b6009c1b9ca3df

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get install -yq --no-install-recommends curl ca-certificates && \
  curl -fSL -o /tmp/heka_${HEKA_VERSION}_amd64.deb https://github.com/mozilla-services/heka/releases/download/v${HEKA_VERSION}/heka_${HEKA_VERSION}_amd64.deb && \
  echo "${HEKA_MD5}  /tmp/heka_${HEKA_VERSION}_amd64.deb" | md5sum --check && \
  dpkg -i /tmp/heka_${HEKA_VERSION}_amd64.deb && \
  rm /tmp/heka_${HEKA_VERSION}_amd64.deb && \
  rm -rf /var/lib/apt/lists/*

#VOLUME ["/etc/heka/conf.d"]
#VOLUME ["/var/cache/hekad"]

#EXPOSE 5565

CMD ["/usr/bin/hekad", "-config=/etc/heka/conf.d/"]
