# scanning-cgibin
Template files to integrate into your web server so that you can scan from a SANE compatible scanner

## Setup
Install apache and setup cgi-bin with instructions similar to [https://stackoverflow.com/a/33592247](https://stackoverflow.com/a/33592247). Confirm your `apache2.conf` file is setup correctly to execute CGI-BIN. Googling your issue will help immensely

Move everything from www/ into /var/www/ on your system

Add this line to `/etc/crontab` to check every 10 minutes for a PDF older than 5 minutes and remove it (nice for security and privacy)
> \*/10 \* \* \* \*	root	/usr/bin/find /var/www/html/ -maxdepth 1 -name 'scan-\*.pdf' -type f -mmin +5 -delete

Install a few dependencies
```$ sudo apt install sane-airscan libimage-exiftool-perl imagemagick --no-install-suggests --no-install-recommends```

Start up your Apache2 webserver and see if it works!

## Troubleshooting
Try running the bash scripts in www/cgi-bin a few times to adjust the settings for your specific scanner setup. If you can ping your SANE-equipped scanner this has a chance of working for it.

Will this work out of the box on your specific setup? Almost certainly not (everyone's setup is unique), but if you need help debugging please open a new issue

## Security
Anyone on your network can access your scan and your computer. Do not expose this to the internet. This program connects to the network, use at your own risk.
