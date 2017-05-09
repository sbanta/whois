#!/bin/bash -ex

docker build -t whois-docker .
docker run whois python whois.py /tmp/whois.py
