#!/bin/bash

# setup
printf "Content-type: text/html\n\n"

# scan image directly
scanimage --preview=yes --preview-in-gray --format=png --device-name=airscan > /var/www/html/scanner/preview.png &&

# logic
printf "Printer online" ||
printf "Printer offline"
