#!/bin/bash

set -ouex pipefail

echo "::group:: ===Install 1Password==="
/tmp/1password.sh
echo "::endgroup::"

echo "::group:: ===Install Other Packages==="
/tmp/packages.sh
echo "::endgroup::"

echo "::group:: ===Install Framework Tool==="
/tmp/framework.sh
echo "::endgroup::"

echo "::group:: ===Enable Closed Lid Disable Finterprint==="
/tmp/fingerprint.sh
echo "::endgroup::"
