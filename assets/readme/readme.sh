#!/bin/sh
# Energized Protection unblock Readme Creator
# make time stamp update
TIMESTAMP=`date +'%b %d, %Y'`
VERSION=`date +'%y.%m.%j'`
# Directory
bsc=../../basic/formats
# Entries Count
basict=$(egrep 'Entries:' $bsc/domains.txt)
# Filter Size
basicabf=$(ls -lah $bsc/filter | awk '{print $5}')
# Domains List Size
basicds=$(ls -lah $bsc/domains.txt | awk '{print $5}')
# DNSMasq Size
basiccs=$(ls -lah $bsc/dnsmasq.conf | awk '{print $5}')
# DNSMasq IPV6 Size
basicc6s=$(ls -lah $bsc/dnsmasq-ipv6.conf | awk '{print $5}')
# Unbound Size
basicus=$(ls -lah $bsc/unbound.conf | awk '{print $5}')
# RPZ Size
basicrs=$(ls -lah $bsc/rpz.txt | awk '{print $5}')
# pDNSf 
basicp=$(ls -lah $bsc/pdnsf.txt | awk '{print $5}')

# add to readme
sed -e "s/_timestamp_/$TIMESTAMP/g" -e "s/_version_/$VERSION/g" -e "s/_basict_/$basict/g" -e "s/_basics_/$basics/g" -e "s/_basic6_/$basic6/g" -e "s/_basicabf_/$basicabf/g" -e "s/_basicds_/$basicds/g" -e "s/_basiccs_/$basiccs/g" -e "s/_basicc6s_/$basicc6s/g" -e "s/_basicus_/$basicus/g" -e "s/_basicrs_/$basicrs/g" -e "s/_basicp_/$basicp/g" readme.template > ../readme.tmp
echo >> ../readme.tmp
# add to file
cat ../readme.tmp  > ../../README.md
echo "- Adding Date"
echo "- Adding Version"
echo "- Adding Total Entries"
echo "- Adding Sizes"

# remove tmp file
rm -rf ../*.tmp

# remove extra text
echo "- Removing Extras"
sed -i -e 's/# Entries: //g' ../../README.md

echo "[+] Done !"