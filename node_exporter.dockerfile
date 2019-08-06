FROM alpine:3.9

LABEL maintainer "Edvaldo Szymonek <edvaldoszy@gmail.com>"
LABEL version 0.1.0

ENV OS linux
ENV ARCH amd64
ENV VERSION 0.18.1


RUN wget https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/node_exporter-${VERSION}.${OS}-${ARCH}.tar.gz && \
    tar -xvzf node_exporter-${VERSION}.${OS}-${ARCH}.tar.gz && \
    rm -f node_exporter-${VERSION}.${OS}-${ARCH}.tar.gz && \
    mv node_exporter-${VERSION}.${OS}-${ARCH}/node_exporter /bin/node_exporter


ENTRYPOINT [ "/bin/node_exporter" ]

EXPOSE 9100
