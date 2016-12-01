FROM alpine:3.4
MAINTAINER Bruno Meneguello <bruno@meneguello.com>

RUN apk add --no-cache openssl &&\
    wget -O /usr/lib/libiperf.so.0 https://iperf.fr/download/ubuntu/libiperf.so.0_3.1.3 &&\
    wget -O /usr/bin/iperf3 https://iperf.fr/download/ubuntu/iperf3_3.1.3 &&\
    chmod +x /usr/bin/iperf3 &&\
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub &&\
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk &&\
    apk add glibc-2.23-r3.apk

ENV LD_LIBRARY_PATH=/usr/lib

EXPOSE 5201

ENTRYPOINT ["iperf3"]
CMD ["--port", "5201", "--server"]
