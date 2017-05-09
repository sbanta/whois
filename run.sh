#!/bin/bash -ex

docker build --no-cache=true -t whois-docker .
docker run whois-docker python whois.py /tmp/whois.py
docker cp /tmp/outfile.csv:~/Desktop/y
