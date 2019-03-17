# XML Projekt

This is a project done at the HSLU Informatik Rotkreuz as part of the XML Course.

## Factsheet

The Factsheet is at [https://github.com:BigSisl/XML-WGCard/doc/Factsheet.md](https://github.com:BigSisl/XML-WGCard/doc/Factsheet.md)

## Example

The default deployment contains one [Example WGCard](example/example-wgcard.pdf)
and one example promotion with the Token _630a57327adda7c4329631bc2c58d0a6_.

Aslong as it is deployed, feel free to test it out at [wgcard.zuercher.io](wgcard.zuercher.io)
or deploy it yourself [bigsisl/xml-wgcard](https://hub.docker.com/r/bigsisl/xml-wgcard).

# Development

You can run this project using the PHP Internal Development Webserver by running the `serve.sh` or `serve.bat` file respectively or as docker container `docker run -p 8000:8000 bigsisl/xml-wgcard`.

You can also run a docker container. Built it with `docker/build.sh` and run it with `docker/debug.sh` to have a development server available.
