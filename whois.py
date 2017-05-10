
from ipwhois import IPWhois
from pprint import pprint
import csv, sys, argparse, getopt
import pandas
import os

def main(argv):
    for opt, arg in opts:
        if opt == '-h':
            print 'run.sh -i <inputfile> -o <outputfile>'
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg
    dest_ip = pandas.read_csv(inputfile, sep=',', usecols=['dest_ip'], squeeze=True)
    count = pandas.read_csv(inputfile, sep=',', usecols=['count'], squeeze=True)
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
    df.to_csv(outputfile, header=False)

if __name__ == "__main__":
    main(sys.argv[1:])
