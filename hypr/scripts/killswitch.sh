#!/bin/bash

# Check if running with sudo
# if [ "$(id -u)" != "0" ]; then
#     echo "This script must be run with sudo."
#     exit 1
# fi

# Flush existing rules
iptables -F
iptables -t nat -F

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow established and related connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow traffic on the WireGuard interface if available
iptables -A INPUT -i wg0 -j ACCEPT
iptables -A OUTPUT -o wg0 -j ACCEPT

# Enable NAT for outbound traffic on the WireGuard interface
iptables -t nat -A POSTROUTING -o wg0 -j MASQUERADE

# Save the rules
if command -v systemctl &> /dev/null; then
    systemctl restart iptables
elif command -v service &> /dev/null; then
    service iptables save
    service iptables restart
else
    echo "Unsupported service management system"
fi
