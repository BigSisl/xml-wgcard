#/bin/sh

cd $(dirname "$0") && cd ../

docker run -it --rm -p 8000:8000 -v /$(pwd):/app xml-wgcard $@
