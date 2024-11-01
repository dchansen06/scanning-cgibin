#!/bin/bash

# setup
rand=$(date +%s)
printf "Content-type: text/html\n\n"

# scan and turn into pdf
scanimage --mode=Color --format=png --resolution=100 --device-name=airscan > /tmp/scan.png &&
convert /tmp/scan.png /tmp/scan.pdf &&

# make easy to edit name and make avaliable
exiftool -Title= /tmp/scan.pdf &> /dev/null &&
mv /tmp/scan.pdf /var/www/html/scanner/scan-$rand.pdf

# clean up
rm /tmp/scan.png
rm /tmp/scan.pdf_original

printf "scan-$rand.pdf"
