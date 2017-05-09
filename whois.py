from ipwhois import IPWhois
from pprint import pprint
import csv

with open('whois.csv', 'rb') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for i in reader:
        obj = IPWhois(i)
        res = obj.lookup_whois()
        pprint(res)

#print(ip_list)

#0bj = IPWhois('192.230.74.158')
#res=obj.lookup_whois()
#pprint(res)
