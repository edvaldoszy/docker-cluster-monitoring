FROM alpine:3.9

LABEL maintainer "Edvaldo Szymonek <edvaldoszy@gmail.com>"
LABEL version 0.1.0

ENV OS linux
ENV ARCH amd64
ENV VERSION 2.11.1


RUN wget https://github.com/prometheus/prometheus/releases/download/v${VERSION}/prometheus-${VERSION}.${OS}-${ARCH}.tar.gz && \
    tar -xvzf prometheus-${VERSION}.${OS}-${ARCH}.tar.gz && \
    rm -f prometheus-${VERSION}.${OS}-${ARCH}.tar.gz

RUN adduser -DH -s /bin/false prometheus && \
    mv prometheus-${VERSION}.${OS}-${ARCH} /etc/prometheus && \
    mkdir -p /var/lib/prometheus && \
    chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus && \
    mv /etc/prometheus/prometheus /etc/prometheus/promtool /bin/


USER prometheus

ENTRYPOINT [ "/bin/prometheus" ]
CMD [ "--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/var/lib/prometheus" ]

EXPOSE 9090
