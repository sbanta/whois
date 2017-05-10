#!/bin/bash -ex

# Usage: run.sh filepath

if [ $# -eq 0 ]; then
  echo "Missing filename or filepath"
  exit 1
else
  filepath=$1
  export filepath
  docker build --no-cache=true -t whois-docker .
  #docker cp $filepath whois-docker:/tmp/
  #docker run --name image_name whois-docker python whois.py /tmp/whois.py -i "/tmp/"$filepath -o outputtest.csv
  docker cp $filepath image_name:/tmp/
  docker exec -it image_name python whois.py /tmp/whois.py -i "/tmp/"$filepath -o outputtest.csv
  docker cp image_name:/tmp/outfiletest.csv ~/Desktop/
fi
