FROM dockenizer/alpine
MAINTAINER Jacques Moati <jacques@moati.net>

ENV RABBITMQ_VERSION=3.6.5

RUN apk add --update curl tar xz && \
    apk add --update-cache --allow-untrusted \
        erlang erlang-mnesia \
        erlang-public-key \
        erlang-crypto \
        erlang-syntax-tools \
        erlang-ssl \
        erlang-sasl \
        erlang-asn1 \
        erlang-inets \
        erlang-os-mon \
        erlang-xmerl \
        erlang-eldap && \

    mkdir /rabbitmq && \
    curl -sSL https://www.rabbitmq.com/releases/rabbitmq-server/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz | tar -Jx -C /rabbitmq/ --strip-components 1 && \

    apk del --purge curl tar xz && \
    rm -rf /var/cache/apk/*

COPY run.sh /rabbitmq/run.sh

RUN mkdir -p /data/rabbitmq && \
    chmod +x /rabbitmq/run.sh

EXPOSE 5672 15672

CMD /rabbitmq/run.sh