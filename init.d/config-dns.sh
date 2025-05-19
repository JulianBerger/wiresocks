#!/bin/bash
#
# a shell script to configure coredns to forward DNS traffic to
# an upstream server, forcing TCP lookups to be socks friendly

echo "configuring DNS root zone to lookup at ${TARGET_DNS_SERVER}..."

cat << EOF > /config/coredns/Corefile
. {
    loop
    log
    forward . /etc/resolv.conf {
        force_tcp
        policy sequential
    }
}
EOF
