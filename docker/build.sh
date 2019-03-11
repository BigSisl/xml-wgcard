#/bin/sh

BASEDIR=$(dirname "$0")
cd $BASEDIR && cd ../

docker build -f docker/Dockerfile -t xml-wgcard .