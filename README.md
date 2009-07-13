Title:		MultiMarkdownTestSuite ReadMe
Author:		Fletcher T. Penney

# Introduction #

John Gruber created a test suite for Markdown. I have used that suite to look
for bugs in MultiMarkdown, and have found and corrected a few.

Additionally, I have added some further tests that are specific to features
found in MultiMarkdown.

Of note, some of the test documents originally used by John contained lines
that were interpreted by MultiMarkdown as metadata, so leading spaces were
added to correct that (this isn't a bug, but rather a consequence of the
metadata feature.) Also, MultiMarkdown automatically adds id attributes to
headers, requiring that the test suite be modified to adjust for this.


# Where can you get it? #

Download the current version of the MMD Test Suite from github:

* <http://github.com/fletcher/MMD-Test-Suite/>


# How To Use #

To use this software, simply run:

	./MarkdownTest.pl --script ~/path/to/MultiMarkdown.pl --tidy
		--testdir MultiMarkdownTests

in order to use MultiMarkdown against the tests contained in the
`MultiMarkdownTests` directory.

To make this easier, you can run the `runtest.pl` or `runtestnotidy.pl`
scripts. They will look for MultiMarkdown in one of the "common" installation
locations and run the tests automatically.

I have also included the original `Tests` directory, which are the original
versions created by John Gruber. Note that 7 of these tests will fail when run
by MultiMarkdown. This is due to the metadata issue mentioned above, as well
as the fact that the `Inline HTML (Advanced)` test contains input that is
incorrectly arranged, and will correctly cause a failure when run against
Markdown or MultiMarkdown. I do not know if John has plans to adjust the
handling of HTML blocks within Markdown to correct for this failure, but I
suspect not.

Again, the `Inline HTML (Advanced)` test *should* fail.

Also, if you leave off the `--tidy` option, the `Tidyness` test will fail for
both MultiMarkdown and Markdown.


# For More Information #

Check out:

* John Gruber's [Markdown](http://daringfireball.net/projects/markdown) page

* My [MultiMarkdown](http://fletcherpenney.net/multimarkdown) page
