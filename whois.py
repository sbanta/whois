from ipwhois import IPWhois
from pprint import pprint
from csv

with open('whois.csv', 'rb') as i:
    reader = csv.reader(i)
    ip_list = list(reader)
    for i in ip_list:
        print i

obj = IPWhois('192.230.74.158')
res=obj.lookup_whois()
pprint(res)
