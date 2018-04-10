FROM golang:1.8

COPY . /go/src/github.com/fatedier/frp

RUN sleep 10 && echo 1
RUN sleep 10 && echo 1
RUN sleep 10 && echo 1
RUN sleep 10 && echo 1
RUN sleep 10 && echo 1

RUN cd /go/src/github.com/fatedier/frp \
 && make \
 && mv bin/frpc /frpc \
 && mv bin/frps /frps \
 && mv conf/frpc.ini /frpc.ini \
 && mv conf/frps.ini /frps.ini \
 && make clean

WORKDIR /

EXPOSE 80 443 6000 7000 7500

ENTRYPOINT ["/frps"]
