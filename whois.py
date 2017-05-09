from ipwhois import IPWhois
from pprint import pprint
obj = IPWhois('192.230.74.158')
res=obj.lookup_whois()
pprint(res)
