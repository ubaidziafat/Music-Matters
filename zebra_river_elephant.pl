#!/usr/bin/perl

#Use modules
use strict;
use warnings;

#Declare variables
my $music = "Music Matters";
my $line;
my $number = 1;

#Output header
print "--$music--\n";

#Write 2000 lines
while ($number <= 2000){
	$line = "This is line #$number - $music\n";
	print $line;
	$number++;
}

print "\n--END--";
exit;