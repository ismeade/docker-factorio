FROM ismeade/debian:jessie

MAINTAINER ismeade <ismeade99@sina.com>

ENV VERSION=1.1.101

RUN set -x && \
    apt-get update && \
    apt-get install -y wget xz-utils && \
    wget -O /factorio_headless_x64_${VERSION}.tar.xz https://www.factorio.com/get-download/${VERSION}/headless/linux64 && \
    xz -d /factorio_headless_x64_${VERSION}.tar.xz && \
    tar -xvf factorio_headless_x64_${VERSION}.tar && \
    apt-get --purge remove -y wget xz-utils && \
    apt-get clean && \
    rm factorio_headless_x64_${VERSION}.tar

ADD start.sh ./ 
RUN chmod +x start.sh
ADD server-settings.json /factorio/data/
VOLUME ["/factorio/saves"]
EXPOSE 34197/udp
ENTRYPOINT ["./start.sh"]
