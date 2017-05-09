#!/bin/bash -ex

docker build --no-cache=true -t whois-docker .
docker run whois-docker python whois.py /tmp/whois.py
docker cp whois-docker:/tmp/outfile.csv ~/Desktop/
