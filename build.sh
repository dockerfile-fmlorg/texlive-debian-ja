#!/bin/sh

docker -D build -t texlive-debian-ja -f ./Dockerfile .

exit 0
