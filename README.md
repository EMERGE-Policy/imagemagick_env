# ImageMagick environment for Emerge-Policy

This repository provides a reproducible installer for the isolated ImageMagick
runtime required by Emerge-Policy's LIBERO-Plus evaluator. The environment is
created locally, so it does not contain paths copied from another machine and
does not modify the main `EmergePolicy` Conda environment.

## Requirements

- Linux (the configuration is tested on x86-64)
- `micromamba`, `mamba`, or `conda` available in `PATH`
- Network access to `conda-forge` during the first installation

## Install

Run from the Emerge-Policy repository root:

```bash
bash third_party/imagemagick_env/install.sh
```

If you are already in this directory, run `bash install.sh` instead.

The script creates the environment at:

```text
third_party/imagemagick_env/.env/
```

The `.env/` directory is intentionally ignored by Git. Running the installer
again is safe; an existing valid installation is verified and reused.

## Verify

```bash
bash third_party/imagemagick_env/verify.sh
```

The Emerge-Policy LIBERO-Plus evaluator configures `MAGICK_HOME` and
`LD_LIBRARY_PATH` automatically. For manual use, configure them as follows:

```bash
export MAGICK_HOME="$PWD/third_party/imagemagick_env/.env"
export LD_LIBRARY_PATH="$MAGICK_HOME/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
```

To recreate the environment, remove `.env/` and run `install.sh` again.
