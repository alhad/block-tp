my $hosts = "C:\\WINDOWS\\System32\\drivers\\etc\\hosts";
#my $hosts = "testhosts";

my @blocked_urls = (
      "www.reddit.com",
      "www.cnn.com",
      "news.ycombinator.com",
      "www.soccernet.com",
      "www.slashdot.org",
      "www.netflix.com",
      "news.google.com",
      );


if($ARGV[0] eq 'block') {
   open HOSTS, ">>$hosts" or die "Could not open HOSTS file: $!";
   print HOSTS "127.0.0.1 $_\n" for @blocked_urls;   
   close HOSTS;
} else {
   open TEMPHOSTS, ">temphosts" or die "Could not open temp file: $!";
   open HOSTS, "$hosts" or die "Could not open HOSTS file: $!";
hostsline: while($line = <HOSTS>) {
      for( @blocked_urls ) {
         next hostsline if ($line =~ m/$_/);
      }
      print TEMPHOSTS "$line";
   }
   close TEMPHOSTS;
   close HOSTS;
   qx/mv temphosts $hosts/;        
}

   


