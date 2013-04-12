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
	my $old_name;
	#Need to ignore the dated directories + the . directory
	
	if ($current eq ".") {
		return;
	}
	if ($current =~/^2013/){
		#print "This is the dated directory. Will return \n";
		return;
	}
	$root = $current;
	if ($current =~/\\/){
		$root =~s/(^\w+)\\.+/$1/;
		if ($root =~/[^\\]/){
			$old_name = $current;
			$current =~s/^\w+\\(.+)/$1/;
			move($old_name,$current);
			move($current,$root) or die "test";
			
			
		}
			
	}
	
}

	#At this point root has been found, so will strip root from the other files and move them to foo
	


		
	



