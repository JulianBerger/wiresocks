#!/bin/bash
#
# a shell script to configure coredns to forward DNS traffic to
# an upstream server, forcing TCP lookups to be socks friendly


cat << EOF > /config/coredns/Corefile
.:53 {
    # Log all queries and responses to standard output.
    # Useful for debugging.
    log stdout

    # Report errors to standard output.
    # Essential for diagnosing issues.
    errors stdout

    # Cache responses for 300 seconds (5 minutes).
    # This reduces latency and load on the upstream server.
    cache 300

    # Forward all queries (.) to 1.1.1.1.
    # You can also specify the port, e.g., 1.1.1.1:53
    forward . 1.1.1.1 {
        # Optional: You can set a health check interval to monitor
        # the upstream server. If it becomes unresponsive, CoreDNS
        # can try other forwarders if configured or stop forwarding.
        # health_check 10s

        # force TCP
        force_tcp
    }

EOF
