#!/usr/bin/perl

#
# Blocks unnecessary distractions by preventing access to certain frequent time waisting sites
#
# Looks for a "blacklist" file in the current directory with one website on each line

if (!@ARGV) {
  print "\n$0: Utility script to block all time wasting websites, to prevent distractions\n\n";
  print "Usage: $0 [block|unblock]\n\n";
  exit 0;
}


open BLACKLIST, "blacklist" or die "Could not open blacklist: $!";
my @blocked_urls = <BLACKLIST>;

my $hosts = "C:\\WINDOWS\\System32\\drivers\\etc\\hosts";

if($ARGV[0] eq 'block') {
  # First make sure we are not called with "block" twice
   open HOSTS, "$hosts" or die "Could not open HOSTS file: $!";
   for ( <HOSTS> ) {
     die "Sites already blocked\n" if m/$blocked_urls[0]/;
   }
   close HOSTS;

   open HOSTS, ">>$hosts" or die "Could not open HOSTS file: $!";
   print HOSTS "127.0.0.1 $_" for @blocked_urls;
   close HOSTS;

} else {
   open HOSTS, "$hosts" or die "Could not open HOSTS file: $!";
   @hostslines = <HOSTS>;
   close HOSTS;
   open HOSTS, ">$hosts" or die "Could not open HOSTS file for write: $!";
hostsline: foreach $line(@hostslines) {
      for( @blocked_urls ) {
         next hostsline if ($line =~ m/$_/);
      }
      print HOSTS "$line";
   }
   close HOSTS;
}

qx%ipconfig /flushdns%;

