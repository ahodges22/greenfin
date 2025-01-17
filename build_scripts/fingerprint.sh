#!/usr/bin/env bash

# Disable Framework fingerprint reader when laptop lid is closed.
# Credit to https://github.com/riptidewave93 for this awesome work!

if ! command -v acpid &> /dev/null; then
    # Add our acpid layer
    dnf install acpid -y
else
    # Selinux policy for acpid
    semodule -i /tmp/fingerprint/acpid-laptop-lid.pp
    
    # Place our config files
    cp /tmp/fingerprint/laptop-lid.sh /etc/acpi/actions/laptop-lid.sh
    cp /tmp/fingerprint/laptop-lid /etc/acpi/events/laptop-lid
    cp /tmp/fingerprint/laptop-lid.service /etc/systemd/system/laptop-lid.service

    # Enable and start services
    systemctl daemon-reload
    systemctl enable acpid.service
    systemctl enable acpid.socket
    systemctl enable laptop-lid.service
fi
