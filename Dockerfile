FROM ubuntu:16.04
MAINTAINER Scott Weston <scott@hronboard.me>

ENV DEBIAN_FRONTEND=noninteractive

RUN set -x \
  && apt-get update \
  && apt-get upgrade \
  && apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages software-properties-common \
  && add-apt-repository -y ppa:webupd8team/java \
  && apt-get update \
  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
  && apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages oracle-java8-installer \
  && apt-get install oracle-java8-set-default \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/bin/java"]
CMD ["-version"]
