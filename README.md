# mds-article: A minimalist article class for LaTeX

by Mark Sprevak, University of Edinburgh  

* Most recent version: <https://github.com/msprev/mds-article>
* Examples of typeset PDFs: <https://sites.google.com/site/msprevak/publications>  

mds-article presents an extremely minimal interface for writing your document.

Configuration of author name, email address, bibliography file, fonts, etc. is through a separate 'definitions' file. The idea is that once this definition file is set and in LaTeX's path, it will be shared between all your documents and there is no need to tinker with it. Definitions can be overridden on a per document basis if needed, e.g., for a multi-authored article, using the commands below.

mds-article can be configured via the definition file to use any LaTeX-accessible font. The examples above use [Minion Pro](<http://goo.gl/lQqMy>) and [inconsolata](<http://www.ctan.org/tex-archive/fonts/inconsolata/>).


# Prerequisites

1. A modern LaTeX installation
2. Biblatex

# Usage

Use the document class `mds-article`:

```latex
\documentclass{mds-article}

\title{My article title}
\published{Forthcoming in the \emph{The Journal}}
\doi{10.1001/abcd/abc001}

\begin{document}
...
\end{document}
```

# Options

* `short`: suppress running headers and use a smaller font for section titles (useful for short documents)

# Commands

## In preamble (before `\begin{document}`)

* `\title{...}`: document title

* `\date{...}`: document date: if absent, uses `\gitAuthorDate` for date

* `\published{...}`: publication info: if absent, display 'Draft only'

* `\doi{...}`: document DOI

* `\email{...}`: override default email

* `\authorblock{...}`: override default author & affiliation (useful for multi-authored papers). Value passed is the content of a standard LaTeX `tabbing` environment that specifies the layout of authors & affiliations, e.g.:

```latex
\authorblock{
  David Hume and Adam Smith \quad \= \emph{University of Cambridge} \quad \= \kill
  David Hume and Adam Smith       \> Bertrand Russell                     \> John Locke \\ 
  \emph{University of Edinburgh}  \> \emph{University of Cambridge}       \> \emph{University of Oxford}
}
```


## Inside `document` environment

* `\signed{...}`: places value flush right, add new line if needed (useful for citations)

* `aquote` environment: a modified `quote` environment that places its argument flush right, a new line added if needed, e.g.:  

```latex
\begin{aquote}{\citep{Lewis00}} 
  ... 
\end{aquote}
```

# Definitions file

The file `mds-article.def` should be in your LaTeX path. If it cannot be found, then mds-article defaults to its internal definitions.

Here is an example `mds-article.def`:

```latex
\def\myauthor{David Hume}
\def\myaffiliation{University of Edinburgh}
\def\myemail{david.hume@ed.ac.uk}
\def\mybibfile{mylibrary.bib}
\def\mylocalisation{british}
\def\mypapersize{a4paper}
\def\loadmainfont{ 
  \RequirePackage{MinionPro}
}
\def\loadmonofont{
  \RequirePackage[scaled=0.85]{inconsolata}
}
\def\myfontsize{11pt}
```

# Acknowledgements

Borrows from many sources, most notably Kieran Healy's nice designs:
<https://github.com/kjhealy/latex-custom-kjh>
