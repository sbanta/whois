#!/bin/bash -ex

docker build -t whois-docker .
docker run whois-docker python whois.py /tmp/whois.py
docker cp /tmp/outfile.csv:~/Desktop/
