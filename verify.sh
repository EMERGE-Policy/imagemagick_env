#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ENV_PREFIX="${SCRIPT_DIR}/.env"
MAGICK_BIN="${ENV_PREFIX}/bin/magick"
MAGICK_WAND="${ENV_PREFIX}/lib/libMagickWand-7.Q16HDRI.so"

if [[ ! -x "${MAGICK_BIN}" || ! -f "${MAGICK_WAND}" ]]; then
  echo "Error: ImageMagick is not installed at ${ENV_PREFIX}." >&2
  echo "Run: bash ${SCRIPT_DIR}/install.sh" >&2
  exit 1
fi

export MAGICK_HOME="${ENV_PREFIX}"
export LD_LIBRARY_PATH="${ENV_PREFIX}/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

"${MAGICK_BIN}" -version
echo "ImageMagick environment is ready at ${ENV_PREFIX}"
