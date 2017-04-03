FROM mysql:5.7

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget axel cpipe

COPY download.sh /usr/local/bin/

VOLUME /download
VOLUME /staging

WORKDIR /download

ENV OPS_LAST_REFRESH 2016.11.11 9pm

COPY staging.sh /usr/local/bin/

CMD /usr/local/bin/download.sh && ln -sf /download/*.sql.gz /staging/ && /usr/local/bin/staging.sh
