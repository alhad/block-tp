block-tp
========

A simple Windows-only script that blocks distracting websites when you need to be concentrating on something.

Usage
-----

perl block-tp.pl block --> blocks the websites

perl block-tp.pl unblock --> unblocks the websites

How does it work
----------------

The script looks for a "blacklist" file, that is in the same folder as the script. It adds all the websites in
this blacklist file to the Windows HOSTS file, and routes them to 127.0.0.1. The Windows HOSTS file is first
consulted whenever a DNS lookup needs to be done by browsers. Since we are routing all the blocked websites
to the local IP address, these will be all looked up on the same machine. Assuming you are not running a copy
of reddit on your local machine ;), it will result in failure errors from your browser.

Why does it work
----------------

When hacking on code, or working on an intensive task with several threads in your brain, it can be tempting to
take a break and browse some of these websites, watch videos etc. Before you know it, you've opened a browser
tab and are trying to access reddit, or hacker news. When you see the error message from the browser, you'll
usually say, "oh yeah, need to work". And thus prevent the huge time wasting distraction.

Attribution
-----------

This is based on git-shit-done, a more fully featured script that does the same thing and supports all platforms. I just needed something simple for my Windows environment at work, and this seemed simpler.

