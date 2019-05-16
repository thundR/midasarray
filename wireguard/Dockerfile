FROM debian

RUN apt-get update && \
    apt-get install -y software-properties-common debconf-utils iptables curl && \
    echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable.list && \
    printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' > /etc/apt/preferences.d/limit-unstable && \
    apt-get update && \
    # echo resolvconf resolvconf/linkify-resolvconf boolean false | debconf-set-selections && \
    apt-get install -y iproute2 wireguard wireguard-dkms wireguard-tools 

RUN echo "10" > /etc/wireguard/host_num.txt
COPY setup.sh /opt/setup.sh
RUN chmod +x /opt/setup.sh
RUN /opt/setup.sh

COPY genconfig_wireguard.sh /usr/bin/genconfig_wireguard.sh
RUN chmod +x /usr/bin/genconfig_wireguard.sh
COPY launch.sh /opt/launch.sh
RUN chmod +x /opt/launch.sh
EXPOSE 2071

ENTRYPOINT ["/opt/launch.sh"]