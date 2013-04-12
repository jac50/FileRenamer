#!/usr/bin/perl
use strict;
use warnings;
use File::Find;
use File::Copy;
# Iterate through every folder in /home/james/VirtualBox Dropped Files
#Check all folders. if folder does not have \, set this to root.
# move all root\blah . blah to root
# move all root\blah folders into foo. all root\foo\blah.blah can be moved to the next.

find(\&iterate,"/home/james/Documents/VirtualBox Dropped Files");

sub iterate { 
	my $current = $_;
	my $root = "";
	my @Path;
	my @slicePath;
	#Need to ignore the dated directories + the . directory
	
	if ($current eq ".") {
		return;
	}
	if ($current =~/^2013/){
		#print "This is the dated directory. Will return \n";
		return;
	}

	@Path = split(/\\/,$current);
	my $path = $current;
	for (my $i = $#Path;$i >0;$i--){
		if (! -d $current) { #if current is NOT  a directory, rename
		print $Path[$i];
		print "\n";
		#if ($Path[$i] eq $Path[-1]) {
			move($current,$Path[-1]);#renaming the file
		#}
			
		}
		#move($Path[$i],$Path[$i - 1]); #moving the renamed folder one move up
	}
	#print "File completed\n";
}

	#At this point root has been found, so will strip root from the other files and move them to foo
	


		
	



