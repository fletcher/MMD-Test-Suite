Title:	MultiMarkdownTestSuite ReadMe  
Author:	Fletcher T. Penney  

# Introduction #

John Gruber created a test suite for Markdown. I have used that suite to look
for bugs in MultiMarkdown, and have found and corrected a few.

Additionally, I have added some further tests that are specific to features
found in MultiMarkdown.

The files in `Tests` are the original test suite. They require MultiMarkdown
to be run in compatibility mode (`multimarkdown -c`) and verify that it can
match the original Markdown output.

The files in `MultiMarkdownTests` are designed to test XHTML and LaTeX output
from MultiMarkdown.

The files in `BeamerTests` specifically test a few features related to the
`beamer` output mode.

The files in `MemoirTests` specifically test a few features related to the
`memoir` output mode.



# Where can you get it? #

Download the current version of the MMD Test Suite from github:

* <http://github.com/fletcher/MMD-Test-Suite/>


It's also linked to from within the source repository for MMD 3.0.


# How To Use #

To use this software, simply run (for example):

	./MarkdownTest.pl --script=~/path/to/MultiMarkdown.pl --tidy
		--testdir=MultiMarkdownTests --ext=".tex" --Flags="-t latex"


I have modified the script to allow a `--Flags` extension that passes the
flags to the script that is called. This can be used to pass flags to the
script to enable compatibility mode, or LaTeX output, or whatever.

Also, see the MMD 3.0 (aka peg-multimarkdown) Makefile to see examples of how
I use this.

# For More Information #

Check out:

* John Gruber's [Markdown](http://daringfireball.net/projects/markdown) page

* My [MultiMarkdown](http://fletcherpenney.net/multimarkdown) page
