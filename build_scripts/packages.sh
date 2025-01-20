#!/bin/bash

# Firefox, needed because the Flatpak version doesn't support native messaging
# GitHub Desktop, needed because the Flatpak version does not integrate with drag and drop
rpm --import https://rpm.packages.shiftkey.dev/gpg.key

sh -c 'echo -e "[shiftkey-packages]\nname=GitHub Desktop\nbaseurl=https://rpm.packages.shiftkey.dev/rpm/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://rpm.packages.shiftkey.dev/gpg.key" > /etc/yum.repos.d/shiftkey-packages.repo'

# Install Ghostty Terminal, not available as a Flatpak
dnf5 copr enable pgdev/ghostty -y

dnf5 install github-desktop firefox ghostty -y --refresh
