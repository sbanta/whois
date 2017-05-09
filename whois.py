
from ipwhois import IPWhois
from pprint import pprint
import csv, sys, argparse
import pandas

dest_ip = pandas.read_csv("whois.csv", sep=',', usecols=['dest_ip'], squeeze=True)
count = pandas.read_csv("whois.csv", sep=',', usecols=['count'], squeeze=True)
outfile = outfile.csv
key = 'description'
output = []
ips = []
for i in dest_ip:
    try:
        obj = IPWhois(i)
        res = obj.lookup_whois()
        ips.append(i)
        output.append(res['nets'][0][key])
    except:
        output.append('Lookup Error')

df = pandas.DataFrame(list(zip(ips, count, output)))
df.to_csv(outfile.csv, header=False)
