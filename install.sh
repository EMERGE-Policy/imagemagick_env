#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ENV_PREFIX="${SCRIPT_DIR}/.env"
ENV_FILE="${SCRIPT_DIR}/environment.yml"

ENV_MANAGER=""
for candidate in micromamba mamba conda; do
  if command -v "${candidate}" >/dev/null 2>&1; then
    ENV_MANAGER="${candidate}"
    break
  fi
done

if [[ -z "${ENV_MANAGER}" ]]; then
  echo "Error: micromamba, mamba, or conda is required but none was found in PATH." >&2
  exit 1
fi

if [[ -f "${ENV_PREFIX}/lib/libMagickWand-7.Q16HDRI.so" ]]; then
  echo "ImageMagick is already installed at ${ENV_PREFIX}"
  exec "${SCRIPT_DIR}/verify.sh"
fi

echo "Installing ImageMagick into ${ENV_PREFIX}"
echo "Using environment manager: ${ENV_MANAGER}"
"${ENV_MANAGER}" env create --yes --prefix "${ENV_PREFIX}" --file "${ENV_FILE}"

"${SCRIPT_DIR}/verify.sh"
