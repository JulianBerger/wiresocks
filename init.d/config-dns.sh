#!/bin/bash
#
# a shell script to configure coredns to forward DNS traffic to
# an upstream server, forcing TCP lookups to be socks friendly


cat << EOF > /config/coredns/Corefile
. {
    loop
    forward . ${TARGET_DNS_SERVER}:53 {
        force_tcp
    }
}
EOF
