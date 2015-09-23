FROM ubuntu
MAINTAINER Scott Weston <scott@hronboard.me>

RUN set -x \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes software-properties-common \
  && add-apt-repository -y ppa:webupd8team/java \
  && apt-get update \
  && echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes oracle-java6-installer \
  && DEBIAN_FRONTEND=noninteractive apt-get install oracle-java6-set-default

ENTRYPOINT ["/usr/bin/java"]
CMD ["-version"]
