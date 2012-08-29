block-tp
========

Inspired by get-shit-done, but way simpler, and just enough for my Windows only needs.

A simple script that gets the job done - blocks the websites I need to blocked, called out right there in the script, by adding them to the Windows 7 hosts file (i.e. hardcoding their IP address to 127.0.0.1 so that NS lookup does not happen for these sites, rather the local web server is tried (which usually there is none).

Simple usage

perl block-tp.pl block --> blocks the websites
perl block-tp.pl unblock --> unblocks the website
