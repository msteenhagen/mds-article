# Article-like style  

by Mark Sprevak --- <http://sites.google.com/site/msprevak>

* Most recent version: <https://github.com/msprev/mds-article>
* Example `.tex` file: <https://github.com/msprev/mds-article>
* Examples of typeset PDFs: <http://goo.gl/Or8cC>  

# Usage

`article-preamble.tex` should be `\input{}` in first line of your `.tex` file, e.g.:

~~~~~~~
\input{article-preamble.tex} 
\title{My article title}
\published{Forthcoming in the \emph{The Journal}}
\doi{10.1001/abcd/abc001}

\begin{document}
...
\end{document}
~~~~~~~

# Useful commands

## Before `\begin{document}`

Command               Effect
-------               ------
`\title{...}`         document title  
`\date{...}`			    document date---if absent, displays `\gitAuthorDate`  
`\published{...}`     publication info---if absent, displays 'Draft only'  
`\doi{...}`				    document DOI  
`\noheaders`			    suppress running headers (useful for short documents)  
      
## Inside the `document` environment

Command               Effect
-------               ------
`\signed{...}`        place flush right, add new line if needed (useful for citations)
      
# Prerequisites

1. A modern LaTeX installation
2. Minion Pro fonts: <http://goo.gl/lQqMy>
3. Biblatex
4. The `gitinfo` package

# Acknowledgements

Borrows from many sources, most notably Kieran Healy's design:
<https://github.com/kjhealy/latex-custom-kjh>
