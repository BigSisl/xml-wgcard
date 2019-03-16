#!/usr/bin/env bash

# you need to have pandoc installed

d="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pandoc -V papersize:a4 \
    -V logo:'`../../public/img/logo.png`{=latex}' \
    -V date:"$(date +'%d.%m.%Y')" \
    --number-sections \
    --pdf-engine=xelatex --listings -H "$d"/header.tex -B "$d"/multicol-start.tex -A "$d"/multicol-end.tex \
    "$d"/../factsheet.md --output=WGCard_Factsheet.pdf

