#!/bin/perl
# Split all the tests!!

open my $tests, '<', "./tests.out";

my $curF ;
while( my $line = <$tests>) {
    if($line =~ /# \[(.*)\] TEST (\d+): (.*)/){# match, new record
      # TODO: si ouvert ferme
      my $type = $1; my $testn = $2; my $descr = $3;

      my $fileName=sprintf "test-%02d-%s.%s", $testn,
	$descr =~ s/ /-/rg, lc $type ;
      print $fileName, "\n";

      close $curF;
      open $curF, '>', $fileName;
      print $curF "#  -*-  restclient -*-\n" if $type =~ /REQ/;
      print $curF $line;
      # see: keep header
    } else { # just append to current file
      print $curF $line
    }
  }
close $curF;
close $tests;

print "done :)", "\n";
