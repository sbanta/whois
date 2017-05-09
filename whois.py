
from ipwhois import IPWhois
from pprint import pprint
import csv, sys, argparse
import pandas

dest_ip = pandas.read_csv("whois.csv", sep=',', usecols=['dest_ip'], squeeze=True)
print dest_ip
outfile = outfile.csv
key = 'description'
for i in dest_ip:
    print i
    obj = IPWhois(i)
    res = obj.lookup_whois()
    #print(res['nets'][0][key])
    res.to_csv(outfile, sep='\t')

#print(ip_list)

#0bj = IPWhois('192.230.74.158')
#res=obj.lookup_whois()
#pprint(res)
