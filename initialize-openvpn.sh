#!/bin/bash

OVPN_DATA=openvpn-data

docker run --name $OVPN_DATA -v /etc/openvpn busybox
docker run --volumes-from $OVPN_DATA --rm kylemanna/openvpn ovpn_genconfig -u udp://rkurr.duckdns.org
docker run --volumes-from $OVPN_DATA --rm -it kylemanna/openvpn ovpn_initpki
docker run --volumes-from $OVPN_DATA --name openvpn --restart always --detach --publish 1194:1194/udp --cap-add=NET_ADMIN -e DEBUG=1 kylemanna/openvpn

