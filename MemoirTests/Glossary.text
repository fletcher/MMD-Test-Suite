latex input:		mmd-article-header
Title:				MultiMarkdown Glossary Test  
CSS:				http://fletcherpenney.net/css/document.css  
latex mode:			memoir
latex input:		mmd-article-begin-doc
latex footer:		mmd-memoir-footer

MultiMarkdown has a special format for footnotes that should represent
glossary terms. This doesn't make much difference in XHTML (because there is
no such thing as a glossary in XHTML), but can be used to generate a glossary
within LaTeX documents.

For example, let's have an entry for `glossary`.[^glossary] And what about
ampersands?[^amp]

Since we want the ampersand entry to be sorted with the a's, and not with
symbols, we put in the optional sort key `ampersand` to control sorting.

	[^glossary]: glossary: Glossary 
		A section at the end ...
		
	[^amp]: glossary: & (ampersand)
		A punctuation mark ...

[^glossary]: glossary: Glossary 
	A section at the end ...

[^amp]: glossary: & (ampersand)
	A punctuation mark ...
