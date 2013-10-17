#!/bin/bash
#: Title:		newfolder
#: Date:		2013-10-17
#: Author:		Felix Buerger <felix@sndtrck.com>
#: Description:	Create new folder and initial files for Info3 course
#:				git add and commit them
#: Options:		Name for folder

if [ -z "$1" ]; then
	printf "%s\n" 	"Please enter name for folder" \
					"Example: ./newfolder foo" \
					"'./newfolder -d' uses YY-MM-DD"
	exit 1
fi

if [ $1 = "-d" ]; then
	newfolder=$(date '+%y-%m-%d')
else
	newfolder=$1
fi

if [ -d $newfolder ]; then
	echo "Folder $newfolder already exists."
	exit 1
fi

documentdate=$(date '+%A, %e. %B %Y')

	mkdir $newfolder
	echo "Folder $newfolder created."
	touch $newfolder/notes.md
	echo "$newfolder/notes.md created."
	echo -E "\documentclass[parskip=full]{scrartcl}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{setspace}
\usepackage{lipsum}

\begin{document}
Felix Bürger\\\\
Informatik 3\\\\
$documentdate

\Huge\textbf{Lecture Summary}

\doublespacing
\normalsize

\lipsum[1]

\lipsum[2]

\end{document}" > $newfolder/lecturesummary.tex
	echo "$newfolder/lecturesummary.tex created."

	echo -E "\documentclass[parskip=full]{scrartcl}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{setspace}
\usepackage{lipsum}

\begin{document}
Felix Bürger\\\\
Informatik 3\\\\
$documentdate

\Huge\textbf{Lab Report}

\doublespacing
\normalsize

\lipsum[1]

\lipsum[2]

\end{document}" > $newfolder/labreport.tex
	echo "$newfolder/labreport.tex created."

	git add $newfolder/*
	git commit -m "Initial script commit"
	echo "All done, lazybone!"
exit 0