#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename;
use Cwd;
use Cwd 'abs_path';


# Determine where MMD is installed.  Use a "common installation" if available.

my $me = $0;		# Where is this script located?
my $MMDPath = LocateMMD($me);

system("./MarkdownTest.pl --script $MMDPath/bin/MultiMarkdown.pl --testdir MultiMarkdownTests");


sub LocateMMD {
	my $me = shift;		# Where am I running from?

	my $os = $^O;	# Mac = darwin; Linux = linux; Windows contains MSWin
	my $MMDPath = "";

	# Determine where MMD is installed.  Use a "common installation"
	# if available.

	$me = dirname($me);

	if ($os =~ /MSWin/) {
		# We're running Windows
	
		# First check our directory to see if we're running inside MMD
		
		if ( -f "$me\\MultiMarkdown\\Support.pm") {
			$MMDPath = "$me\\..";
		}
		
		# Next, look in user's home directory, then in common directories
		if ($MMDPath eq "") {
			if ( -d "$ENV{HOMEDRIVE}$ENV{HOMEPATH}\\MultiMarkdown") {
				$MMDPath = "$ENV{HOMEDRIVE}$ENV{HOMEPATH}\\MultiMarkdown";
			} elsif ( -d "$ENV{HOMEDRIVE}\\Documents and Settings\\All Users\\MultiMarkdown") {
				$MMDPath = "$ENV{HOMEDRIVE}\\Documents and Settings\\All Users\\MultiMarkdown";
			}
		}

		# Load the MultiMarkdown::Support.pm module
		do "$MMDPath\\bin\\MultiMarkdown\\Support.pm" if ($MMDPath ne "");
	} else {
		# We're running Mac OS X or some *nix
		
		# First check our directory to see if we're running inside MMD
		
		if ( -f "$me/MultiMarkdown/Support.pm") {
			$MMDPath = "$me/..";
		}
		
		# Next, look in user's home directory, then in common directories
		if ($MMDPath eq "") {
			if (defined($ENV{HOME})) {
				if ( -d "$ENV{HOME}/Library/Application Support/MultiMarkdown") {
					$MMDPath = "$ENV{HOME}/Library/Application Support/MultiMarkdown";
				} elsif ( -d "$ENV{HOME}/.multimarkdown") {
					$MMDPath = "$ENV{HOME}/.multimarkdown";	
				}
			}
			if ($MMDPath eq "") {
				if ( -d "/Library/Application Support/MultiMarkdown") {
					$MMDPath = "/Library/Application Support/MultiMarkdown";
				} elsif ( -d "/usr/share/multimarkdown") {
					$MMDPath = "/usr/share/multimarkdown";
				}
			}
		}
	}

	if ($MMDPath eq "") {
		die "You do not appear to have MultiMarkdown installed.\n";
	} else {
		# Load the MultiMarkdown::Support.pm module
		$MMDPath = abs_path($MMDPath);
		do "$MMDPath/bin/MultiMarkdown/Support.pm";
	}

	# Clean up the path
	$MMDPath = abs_path($MMDPath);

	return $MMDPath;
}