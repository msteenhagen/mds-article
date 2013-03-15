# Article-like style  

by Mark Sprevak, University of Edinburgh — <http://sites.google.com/site/msprevak>

1. Most recent version: <https://github.com/msprev/mds-article>
2. Example `.tex` file: <https://github.com/msprev/mds-article>
3. Examples of typeset PDFs: <http://goo.gl/Or8cC>  

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

## In preamble before `\begin{document}`

<<<<<<< HEAD
| Command           | Effect                                                 |
=======

| Command           | Effect       
>>>>>>> 8ed74001b5b75cef4b9ac0d3b62a6b9afad41ff4
| ----------------- | ------------------------------------------------------ |
| `\title{...}`     | document title                                         |
| `\date{...}`      | document date: if absent, display `\gitAuthorDate`     |
| `\published{...}` | publication info: if absent, displays 'Draft only'     |
| `\doi{...}`       | document DOI                                           |
| `\noheaders`      | suppress running headers (useful for short documents)  |
<<<<<<< HEAD

## Inside the `document` environment

1. `\signed{...}`: places text flush right, add new line if needed (useful for citations)

2. `aquote` environment: `quote` environment with citation placed flush right, a new line added if needed, e.g.: `\begin{aquote}{\citep{Lewis00}} ... \end{aquote}`
=======
      
## Inside `document` environment

| Command              | Effect       
| -------------------- | --------------------------------------------------- |
| `\signed{...}`       | place text flush right, add new line if needed      |
|                      | (useful for citations)                              |
| `aquote` environment | `quote` environment with citation flush right, new  |
|                      | line if needed, e.g.:                               |
|                      | `\begin{aquote}{\citep{Lewis00}} ... \end{aquote}`  |
>>>>>>> 8ed74001b5b75cef4b9ac0d3b62a6b9afad41ff4

# Prerequisites

1. A modern LaTeX installation
2. Minion Pro fonts: <http://goo.gl/lQqMy>
3. Biblatex
4. The `gitinfo` package

# Acknowledgements

Borrows from many sources, most notably Kieran Healy's design:
<https://github.com/kjhealy/latex-custom-kjh>
