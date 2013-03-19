# Article-like preamble  

by Mark Sprevak, University of Edinburgh  

1. Most recent version: <https://github.com/msprev/mds-article>
2. Examples of typeset PDFs: <https://sites.google.com/site/msprevak/publications>  

# Prerequisites

1. A modern LaTeX installation
2. Minion Pro fonts: <http://goo.gl/lQqMy>
3. Biblatex
4. The `gitinfo` package

# Usage

`article-preamble.tex` should be `\input{}` in first line of your `.tex` file, e.g.:

```latex
\input{article-preamble.tex} 
\title{My article title}
\published{Forthcoming in the \emph{The Journal}}
\doi{10.1001/abcd/abc001}

\begin{document}
...
\end{document}
```

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

* `\noheaders`: suppress running headers (useful for short documents)

## Inside `document` environment

* `\signed{...}`: places value flush right, add new line if needed (useful for citations)

* `aquote` environment: a modified `quote` environment that places its argument flush right, a new line added if needed, e.g.:  

```latex
\begin{aquote}{\citep{Lewis00}} 
  ... 
\end{aquote}
```

# Acknowledgements

Borrows from many sources, most notably Kieran Healy's nice designs:
<https://github.com/kjhealy/latex-custom-kjh>
