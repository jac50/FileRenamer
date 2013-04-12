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
	#my $root = "";
	my $baseName = $File::Find::dir;
	my @Path;
	#my @slicePath;
	my $newDir;
	my $name;
	#Need to ignore the dated directories + the . directory
	
	if ($current eq ".") {
		return;
	}
	if ($current =~/^2013/){
		#print "This is the dated directory. Will return \n";
		return;
	}
	@Path = split(/\\/,$current);
	if (! -d $current){
		$name = pop(@Path);
		print $name;
		print "\n";
 		my $partPath = join("\/",@Path);
		my $newDir = join("\/",$baseName,$partPath);
		move($current,$name);
		move($name,$newDir);	
	}
	else {
		$name = pop(@Path);
		my $partPath = join("\/",@Path);
		my $newDir = join("\/",$baseName,$partPath);
		move($current,$name);
		move($name,$newDir);
	}



}
	
	
		
	



