#!/bin/bash -ex

docker build --no-cache=true -t whois-docker .
docker run whois-docker python whois.py /tmp/whois.py
docker cp 7a3db01a5762:/tmp/outfile.csv ~/Desktop/
