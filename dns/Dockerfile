
FROM golang:alpine as builder

# Build dnscrypt-proxy
RUN apk add --update git
RUN go get -v golang.org/x/net/http2
RUN go get -v -d github.com/jedisct1/dnscrypt-proxy/dnscrypt-proxy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -a -v github.com/jedisct1/dnscrypt-proxy/dnscrypt-proxy

FROM debian:stable
RUN apt-get update
RUN apt-get install -y python python-requests
COPY --from=builder /go/dnscrypt-proxy /opt/
RUN mkdir /opt/domain-blacklists/
# COPY --from=builder /go/src/github.com/jedisct1/dnscrypt-proxy/utils/generate-domains-blacklists/ /opt/domain-blacklists/
COPY ./download_hosts.py /opt/domain-blacklists/
COPY ./generate-domains-blacklist.py /opt/domain-blacklists/generate-domains-blacklist.py
COPY ./clean_hosts_and_generate.sh /opt/domain-blacklists/clean_hosts_and_generate.sh
WORKDIR /opt/domain-blacklists
COPY ./domains-whitelist.txt /opt/domain-blacklists/domains-whitelist.txt
RUN python /opt/domain-blacklists/download_hosts.py
# RUN chmod +x /opt/domain-blacklists/clean_hosts_and_generate.sh
RUN python generate-domains-blacklist.py -i -c /opt/domain-blacklists/domains-blacklist.conf -w /opt/domain-blacklists/domains-whitelist.txt > /opt/blacklist.txt
COPY ./dnscrypt-proxy.toml /opt/
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY ./hosts.txt    /opt/

# EXPOSE 53
ENTRYPOINT [ "/entrypoint.sh" ]
