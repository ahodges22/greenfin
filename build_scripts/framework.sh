#!/usr/bin/env bash
set -euo pipefail

REPO="ahodges22/framework-system"
ASSET_NAME="framework_tool"
INSTALL_PATH="/usr/bin/${ASSET_NAME}"

LATEST_RELEASE_JSON=$(curl --silent "https://api.github.com/repos/${REPO}/releases/latest")

ASSET_URL=$(echo "${LATEST_RELEASE_JSON}" \
  | grep browser_download_url \
  | grep "${ASSET_NAME}" \
  | cut -d '"' -f 4)

if [[ -z "${ASSET_URL}" ]]; then
  echo "Error: Could not find an asset named '${ASSET_NAME}' in the latest release."
  exit 1
fi

echo "Downloading '${ASSET_NAME}' from: ${ASSET_URL}"

curl -L "${ASSET_URL}" -o "${INSTALL_PATH}"
chmod +x "${INSTALL_PATH}"

echo "Successfully installed '${ASSET_NAME}' to ${INSTALL_PATH}"
