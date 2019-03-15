#!/bin/sh

# this package contains the fop command
# https://packages.debian.org/stretch/fop

# we should not rely on the webservice they provided because
# we would need to embed everything into a single fop file
# and we can do more this way


# we move into the public folder so
# the wgcard logo can be found
# either adjust the path or change it
cd "public"

# we could probably totally remove this from
# the public folder and we only need to write
# the pdf to it. (We could also mail it)

fop -xml wg.xml -xsl fo/wgcard.xsl -pdf ../out.pdf
