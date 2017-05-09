from ipwhois import IPWhois
from pprint import pprint
import csv

with open('whois.csv', 'rb') as i:
    reader = csv.reader(i)
    ip_list = list(reader)

print(ip_list)

obj = IPWhois('192.230.74.158')
res=obj.lookup_whois()
pprint(res)
