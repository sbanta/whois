#!/bin/bash -ex

# Usage: run.sh filepath

if [ $# -eq 0 ]; then
  echo "Missing filename or filepath"
  exit 1
else
  filepath=$1
  outfile=$2
  docker build -t whois-docker:1.0 .
  docker run -d --name whois whois-docker:1.0
  docker cp $filepath testing:/app/
  docker exec -it whois ls /app/
  docker exec -it whois python whois.py -i "/app/"$filepath -o $outfile
  docker cp whois:/app/$outfile .
  docker stop whois
  docker rmi whoid-docker:1.0
fi
