#!/usr/bin/env bash

# you need to have pandoc installed

d="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pandoc -V papersize:a4 \
    -V geometry:margin=1in \
    -V fontsize:11pt \
    -V documentclass:extarticle \
    --number-sections \
    --pdf-engine=xelatex --listings -H "$d"/header.tex -B "$d"/multicol-start.tex -A "$d"/multicol-end.tex \
    "$d"/../factsheet.md --output=WGCard_Factsheet.pdf

