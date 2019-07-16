#!/bin/bash
#-------------------------------------------------------------------------------#
#-------------------------- I N F O  &  L I C E N S E --------------------------#
#-------------------------------------------------------------------------------#
# Energized Protection - ad.porn.malware blocking.
# Packs Building Script
# Git: http://go.energized.pro/github
# WEB: https://energized.pro
# @adroitadorkhan
# License: CC BY-NC-SA 4.0
#clear
#-------------------------------------------------------------------------------#
#--------------------------------- C O L O R S ---------------------------------#
#-------------------------------------------------------------------------------#
BL='\033[1;30m' # Black
R='\033[1;31m'  # Red
G='\033[1;32m'  # Green
Y='\033[1;33m'  # Yellow
B='\033[1;34m'  # Blue
P='\033[1;35m'  # Purple
C='\033[1;36m'  # Cyan
W='\033[1;37m'  # White
N='\033[0m'     # No Color

#-------------------------------------------------------------------------------#
#------------------------------ V A R I A B L E S ------------------------------#
#-------------------------------------------------------------------------------#
date=$(date +%d.%m.%Y)
formats=formats
domains=$formats/domains.txt
filter=$formats/filter
dnsMasq=$formats/dnsmasq.conf
dnsMasqIPV6=$formats/dnsmasq-ipv6.conf
unbound=$formats/unbound.conf
rpz=$formats/rpz.txt
pdnsf=$formats/pdnsf.txt
file=list
fileTemp=list.temp
urls=urls
footer=$formats/footer
footerAB=$formats/footerAB
footerRPZ=$formats/footerRPZ
footerOL=$formats/footerOL
temp=$formats/temp
atemp=$formats/a.temp
wtemp=$formats/w.temp
divider='------------------------------------------------------------' 2>/dev/null
#-------------------------------------------------------------------------------#
#--------------------------- P A C K  D E T A I L S ----------------------------#
#-------------------------------------------------------------------------------#
#----------------------------- FILL THE INFO HERE ------------------------------#
#-------------------------------------------------------------------------------#
pack="basic"
dividerTiny="--------------------------------------------"
headerLogo="#    _____  _________  _____________  _______\n#   / __/ |/ / __/ _ \/ ___/  _/_  / / __/ _ \ \n#  / _// ,  / _// , _/ (_ // /  / /_/ _// // /\n# /___/_/|_/___/_/|_|\___/___/ /___/___/____/\n#\n#    P   R   O   T   E   C   T   I   O   N\n# $dividerTiny\n#          ad.porn.malware blocking.\n#                   ------\n#      Merged collection of hosts from\n#             reputable sources.\n# $dividerTiny\n#               energized.pro\n#    github.com/EnergizedProtection/block\n# $dividerTiny\n#\n#        Let's make an annoyance free\n#      better open internet. Altogether.\n#                  ------\n#"
headerLogoAB="!    _____  _________  _____________  _______\n!   / __/ |/ / __/ _ \/ ___/  _/_  / / __/ _ \ \n!  / _// ,  / _// , _/ (_ // /  / /_/ _// // /\n! /___/_/|_/___/_/|_|\___/___/ /___/___/____/\n!\n!    P   R   O   T   E   C   T   I   O   N\n! $dividerTiny\n!          ad.porn.malware blocking.\n!                   ------\n!      Merged collection of hosts from\n!             reputable sources.\n! $dividerTiny\n!               energized.pro\n!    github.com/EnergizedProtection/block\n! $dividerTiny\n!\n!        Let's make an annoyance free\n!      better open internet. Altogether.\n!                  ------\n!"
headerLogoRPZ=";    _____  _________  _____________  _______\n;   / __/ |/ / __/ _ \/ ___/  _/_  / / __/ _ \ \n;  / _// ,  / _// , _/ (_ // /  / /_/ _// // /\n; /___/_/|_/___/_/|_|\___/___/ /___/___/____/\n;\n;    P   R   O   T   E   C   T   I   O   N\n; $dividerTiny\n;          ad.porn.malware blocking.\n;                   ------\n;      Merged collection of hosts from\n;             reputable sources.\n; $dividerTiny\n;               energized.pro\n;    github.com/EnergizedProtection/block\n; $dividerTiny\n;\n;        Let's make an annoyance free\n;      better open internet. Altogether.\n;                  ------\n;"
localHost="# $dividerTiny\n# L O C A L  H O S T\n# $dividerTiny\n127.0.0.1 localhost\n127.0.0.1 localhost.localdomain\n127.0.0.1 local\n255.255.255.255 broadcasthost\n::1 localhost\n::1 ip6-localhost\n::1 ip6-loopback\nfe80::1%lo0 localhost\nff00::0 ip6-localnet\nff00::0 ip6-mcastprefix\nff02::1 ip6-allnodes\nff02::2 ip6-allrouters\nff02::3 ip6-allhosts\n0.0.0.0 0.0.0.0\n# $dividerTiny"
localHostRPZ="; $dividerTiny\n; R P Z\n; $dividerTiny\n\$TTL 2h\n@ IN SOA localhost. root.localhost. (1 6h 1h 1w 2h)\n  IN NS  localhost.\n; $dividerTiny"
f1="_any device: compatible with all devices, regardless of OS."
f2="_unblockings: simply unblocks legit, common, cdn, api & safe-to-unblock domains."
f3="_multiple formats: different variants for different devices & extensions."
f4="_hassle free: apply once and never worry about getting blocked again!"
f5="_support: user friendly chat group got your back!"
f6="_clean: no extra abracadabra!"
ador="@AdroitAdorKhan - Head Developer & Maintainer"
avinash="@AvinashReddy3108 - Developer"
badmojr="@badmojr - Maintainer"
packName="Energized Basic Protection - Whitelist"
packDesc="Basic list of whitelisted domains."
buildVersion=$(date +%y.%m.%j)
releaseVersion=$(date +%j)
packCode="E84S1C-W"
license="MIT, https://energized.pro/license"
raw="https://github.com/EnergizedProtection/unblock/raw/master/$pack/formats"
updateDate=$(date +"%a, %d %b %y %H:%M:%S")
expiry="7 days (update frequency)"
echo -n "# $dividerTiny\n# E N E R G I Z E D  E N D S\n# $dividerTiny\n#\n# - - - -  S T A Y  E N E R G I Z E D  - - - -" >> $footer
echo -n "! $dividerTiny\n! E N E R G I Z E D  E N D S\n! $dividerTiny\n!\n! - - - -  S T A Y  E N E R G I Z E D  - - - -" >> $footerAB
echo -n "; $dividerTiny\n; E N E R G I Z E D  E N D S\n; $dividerTiny\n;\n; - - - -  S T A Y  E N E R G I Z E D  - - - -" >> $footerRPZ
echo -n "\n# $dividerTiny\n# E N E R G I Z E D  E N D S\n# $dividerTiny\n#\n# - - - -  S T A Y  E N E R G I Z E D  - - - -" >> $footerOL
echo $W"[+] Enter Token: $TOKEN"$N
read TOKEN
curl -s -o $file -L https://$TOKEN@raw.githubusercontent.com/AdroitAdorKhan/Energized-Protection-Core/master/corps
clear
#-------------------------------------------------------------------------------#
#--------------------------- P R O C E S S  P A C K ----------------------------#
#-------------------------------------------------------------------------------#
awk '$0=$0' $file > $domains
awk '$0="@@||"$0"^"' $file > $filter
awk '$0="server=/"$0"/1.1.1.1/"' $file > $dnsMasq
awk '$0="server=/"$0"/2606:4700:4700::1111/"' $file > $dnsMasqIPV6
awk '$0="local-zone: \""$0"\" transparent"' $file > $unbound
awk '$0=$0" CNAME rpz-passthru."' $file > $rpz
awk '$0="!"$0' $file > $pdnsf
#-------------------------------------------------------------------------------#
#--------------------------------- E C H O S -----------------------------------#
#-------------------------------------------------------------------------------#
# Read Total Domain Number
totaldomains=$(awk '!/^#/ && !/^$/{c++}END{print c}' $file | awk '{ len=length($0); res=""; for (i=0;i<=len;i++) { res=substr($0,len-i+1,1) res; if (i > 0 && i < len && i % 3 == 0) { res = "," res } }; print res }')
# Echo Pack, Domains and Size
echo $Y"!    _____  _________  _____________  _______\n!   / __/ |/ / __/ _ \/ ___/  _/_  / / __/ _ \ \n!  / _// ,  / _// , _/ (_ // /  / /_/ _// // /\n! /___/_/|_/___/_/|_|\___/___/ /___/___/____/\n!\n!    P   R   O   T   E   C   T   I   O   N"$N
echo $Y"! $dividerTiny"$N
echo $Y"! B U I L D I N G  P A C K S"$N
echo $Y"! $dividerTiny"$N
echo $G"! Pack: "$N$Y"$packName"$N
echo $G"! Domains: "$N$W"$totaldomains"$N
echo $G"! Version: "$N$W"$buildVersion"$N
echo $Y"! $dividerTiny"$N
#-------------------------------------------------------------------------------#
#-------------------------- B U I L D  F O R M A T S ---------------------------#
#-------------------------------------------------------------------------------#
# Clear Cache
rm -f $temp $atemp
echo $G"! Building "$N$Y"domain list"$N$G" Format"$N
# Domain List Header
echo "$headerLogo
# $dividerTiny
# P A C K  D E T A I L S
# $dividerTiny
# Title: $packName
# Description: $packDesc
# Format: domain list
# Version: $buildVersion
# Release: $releaseVersion
# Entries: $totaldomains
# Pack Code: $packCode
# License: $license
# Updated: $updateDate
# RAW: $raw/domains.txt
# $dividerTiny
#
# $dividerTiny
# F E A T U R E S
# $dividerTiny
# $f1\n# $f2\n# $f3\n# $f4\n# $f5\n# $f6
# $dividerTiny
#
# $dividerTiny
# T E A M  B O L T Z - meet the team
# $dividerTiny
# $ador\n# $avinash\n# $badmojr
# $dividerTiny
#
# $dividerTiny
# E N E R G I Z E D  B E G I N S
# $dividerTiny" >> $temp
# Build Domain List
cat $temp $domains $footer > $atemp
mv -f $atemp $domains
#-------------------------------------------------------------------------------#
# Clear Cache
rm -f $temp $atemp
echo $G"! Building "$N$Y"adblock filter"$N$G" Format"$N
# Adblock Filter Header
echo "$headerLogoAB
! $dividerTiny
! P A C K  D E T A I L S
! $dividerTiny
! Title: $packName
! Description: $packDesc
! Format: adblock
! Version: $buildVersion
! Release: $releaseVersion
! Expires: $expiry
! Entries: $totaldomains
! Pack Code: $packCode
! License: $license
! Updated: $updateDate
! RAW: $raw/filter
! $dividerTiny
!
! $dividerTiny
! F E A T U R E S
! $dividerTiny
! $f1\n! $f2\n! $f3\n! $f4\n! $f5\n! $f6
! $dividerTiny
!
! $dividerTiny
! T E A M  B O L T Z - meet the team
! $dividerTiny
! $ador\n! $avinash\n! $badmojr
! $dividerTiny
!
! $dividerTiny
! E N E R G I Z E D  B E G I N S
! $dividerTiny" >> $temp
# Build Filter
cat $temp $filter $footerAB > $atemp
mv -f $atemp $filter
#-------------------------------------------------------------------------------#
# Clear Cache
rm -f $temp $atemp
echo $G"! Building "$N$Y"DNSMasq"$N$G" Format"$N
# DNSMasq Header
echo "$headerLogo
# $dividerTiny
# P A C K  D E T A I L S
# $dividerTiny
# Title: $packName
# Description: $packDesc
# Format: dnsmasq
# Version: $buildVersion
# Release: $releaseVersion
# Entries: $totaldomains
# Pack Code: $packCode
# License: $license
# Updated: $updateDate
# RAW: $raw/dnsmasq.conf
# $dividerTiny
#
# $dividerTiny
# F E A T U R E S
# $dividerTiny
# $f1\n# $f2\n# $f3\n# $f4\n# $f5\n# $f6
# $dividerTiny
#
# $dividerTiny
# T E A M  B O L T Z - meet the team
# $dividerTiny
# $ador\n# $avinash\n# $badmojr
# $dividerTiny
#
# $dividerTiny
# E N E R G I Z E D  B E G I N S
# $dividerTiny" >> $temp
# Build DNSMasq
cat $temp $dnsMasq $footer > $atemp
mv -f $atemp $dnsMasq
#-------------------------------------------------------------------------------#
# Clear Cache
rm -f $temp $atemp
echo $G"! Building "$N$Y"DNSMasq ipv6"$N$G" Format"$N
# DNSMasq IPV6 Header
echo "$headerLogo
# $dividerTiny
# P A C K  D E T A I L S
# $dividerTiny
# Title: $packName
# Description: $packDesc
# Format: dnsmasq ipv6
# Version: $buildVersion
# Release: $releaseVersion
# Entries: $totaldomains
# Pack Code: $packCode
# License: $license
# Updated: $updateDate
# RAW: $raw/dnsmasq-ipv6.conf
# $dividerTiny
#
# $dividerTiny
# F E A T U R E S
# $dividerTiny
# $f1\n# $f2\n# $f3\n# $f4\n# $f5\n# $f6
# $dividerTiny
#
# $dividerTiny
# T E A M  B O L T Z - meet the team
# $dividerTiny
# $ador\n# $avinash\n# $badmojr
# $dividerTiny
#
# $dividerTiny
# E N E R G I Z E D  B E G I N S
# $dividerTiny" >> $temp
# Build DNSMasq IPV6
cat $temp $dnsMasqIPV6 $footer > $atemp
mv -f $atemp $dnsMasqIPV6
#-------------------------------------------------------------------------------#
# Clear Cache
rm -f $temp $atemp
echo $G"! Building "$N$Y"unbound"$N$G" Format"$N
# Unbound Header
echo "$headerLogo
# $dividerTiny
# P A C K  D E T A I L S
# $dividerTiny
# Title: $packName
# Description: $packDesc
# Format: unbound
# Version: $buildVersion
# Release: $releaseVersion
# Entries: $totaldomains
# Pack Code: $packCode
# License: $license
# Updated: $updateDate
# RAW: $raw/unbound.conf
# $dividerTiny
#
# $dividerTiny
# F E A T U R E S
# $dividerTiny
# $f1\n# $f2\n# $f3\n# $f4\n# $f5\n# $f6
# $dividerTiny
#
# $dividerTiny
# T E A M  B O L T Z - meet the team
# $dividerTiny
# $ador\n# $avinash\n# $badmojr
# $dividerTiny
#
# $dividerTiny
# E N E R G I Z E D  B E G I N S
# $dividerTiny" >> $temp
# Build Unbound
cat $temp $unbound $footer > $atemp
mv -f $atemp $unbound
#-------------------------------------------------------------------------------#
# Clear Cache
rm -f $temp $atemp
echo $G"! Building "$N$Y"rpz"$N$G" Format"$N
# RPZ Header
echo "$headerLogoRPZ
; $dividerTiny
; P A C K  D E T A I L S
; $dividerTiny
; Title: $packName
; Description: $packDesc
; Format: rpz
; Version: $buildVersion
; Release: $releaseVersion
; Entries: $totaldomains
; Pack Code: $packCode
; License: $license
; Updated: $updateDate
; RAW: $raw/rpz.txt
; $dividerTiny
;
$localHostRPZ
;
; $dividerTiny
; F E A T U R E S
; $dividerTiny
; $f1\n; $f2\n; $f3\n; $f4\n; $f5\n; $f6
; $dividerTiny
;
; $dividerTiny
; T E A M  B O L T Z - meet the team
; $dividerTiny
; $ador\n; $avinash\n; $badmojr
; $dividerTiny
;
; $dividerTiny
; E N E R G I Z E D  B E G I N S
; $dividerTiny" >> $temp
# Build RPZ
cat $temp $rpz $footerRPZ > $atemp
mv -f $atemp $rpz
#-------------------------------------------------------------------------------#
# Clear Cache
rm -f $temp $atemp
echo $G"! Building "$N$Y"one-line"$N$G" Format"$N
# One Line Header
echo "$headerLogo
# $dividerTiny
# P A C K  D E T A I L S
# $dividerTiny
# Title: $packName
# Description: $packDesc
# Format: personalDNSfilter
# Version: $buildVersion
# Release: $releaseVersion
# Entries: $totaldomains
# Pack Code: $packCode
# License: $license
# Updated: $updateDate
# RAW: $raw/pdnsf.txt
# $dividerTiny
#
# $dividerTiny
# F E A T U R E S
# $dividerTiny
# $f1\n# $f2\n# $f3\n# $f4\n# $f5\n# $f6
# $dividerTiny
#
# $dividerTiny
# T E A M  B O L T Z - meet the team
# $dividerTiny
# $ador\n# $avinash\n# $badmojr
# $dividerTiny
#
# $dividerTiny
# E N E R G I Z E D  B E G I N S
# $dividerTiny" >> $temp
# Build pDNSf
cat $temp $pdnsf $footerOL > $atemp
mv -f $atemp $pdnsf
#-------------------------------------------------------------------------------#
# Complete
echo $Y"! $dividerTiny"$N
echo $G"! DONE BUILDING PACK & FORMATS."$N
echo $Y"! $dividerTiny"$N

# Remove Stales
rm -f "$temp" "$atemp" "$file" "$whitelist" "$footer" "$footerAB" "$footerRPZ" "$footerOL"

#-------------------------------------------------------------------------------#
#---------------------------------- D O N E  -----------------------------------#
#-------------------------------------------------------------------------------#