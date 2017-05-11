#!/bin/bash -ex

# Usage: run.sh filepath

if [ $# -eq 0 ]; then
  echo "Missing filename or filepath"
  exit 1
else
  filepath=$1
  export filepath
  docker build -t whois-docker .
  #docker cp $filepath whois-docker:/tmp/
  #docker run --name image_name whois-docker python whois.py /tmp/whois.py -i "/tmp/"$filepath -o outputtest.csv
  #docker cp $filepath whois-docker:/tmp/
  #docker run -it whois-docker python whois.py /tmp/whois.py -i "/tmp/"$filepath -o outputtest.csv
  #docker run --name testing -it -d whois-docker /bin/bash
  docker start testing
  docker cp $filepath testing:/app/
  docker exec -it testing ls /app/
  docker exec -it testing python whois.py -i "/app/"$filepath -o outputtest.csv
  docker cp testing:/app/outputtest.csv .
  docker stop testing
  docker rm testing
fi
