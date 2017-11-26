#!/bin/bash

set -euo pipefail

LATEX_CLEAN_CMD="latexmk -pdf -C main.tex"
LATEX_CMD="latexmk -pdf main.tex"

if [[ $# == 1 && ($1 == "-s" || $1 == "--secret") ]]; then
    $LATEX_CLEAN_CMD
    gpg --output secret.tex -d secret.tex.gpg
    $LATEX_CMD
    rm secret.tex
    exit 0
fi

if [[ $# == 0 ]]; then
    $LATEX_CLEAN_CMD
    $LATEX_CMD
    exit 0
fi

echo "Usage: $0 [-s|--secret]"
echo "  -s|--secret    decrypt the secrets and build uncensored document"

