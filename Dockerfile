FROM python:2.7

#RUN apt-get -u update && apt-get upgrade -y && apt-get install git
RUN rm -rf /tmp
RUN git clone https://github.com/sbanta/whois.git /tmp/
WORKDIR /tmp/
RUN git pull
RUN pip install ipwhois
RUN pip install pprint
RUN pip install pandas
