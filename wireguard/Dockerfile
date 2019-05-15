FROM debian

RUN apt-get update && \
    apt-get install -y software-properties-common debconf-utils iptables curl && \
    add-apt-repository --yes ppa:wireguard/wireguard && \
    apt-get update && \
    # echo resolvconf resolvconf/linkify-resolvconf boolean false | debconf-set-selections && \
    apt-get install -y iproute2 wireguard-dkms wireguard-tools curl 

RUN echo "10" | /etc/wireguard/host_num.txt
COPY setup.sh /opt/setup.sh
RUN chmod +x /opt/setup.sh
RUN /opt/setup.sh


COPY wgnet0.conf /etc/wireguard/.
COPY launch.sh /opt/launch.sh
EXPOSE 2071

ENTRYPOINT ["/opt/launch.sh"]