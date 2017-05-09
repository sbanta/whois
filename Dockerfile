FROM python:2.7

RUN apt-get -u update && apt-get upgrade -y && apt-get install git
RUM rm -rf /tmp/
RUN git clone https://github.com/sbanta/whois.git /tmp/
RUN git clone https://github.com/sbanta/whois.csv /tmp/
RUN pip install ipwhois
RUN pip install pprint
WORKDIR /tmp/
