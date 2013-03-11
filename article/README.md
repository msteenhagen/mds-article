# Article-class preamble  

by Mark Sprevak (<http://sites.google.com/site/msprevak>)

* Examples of typeset PDFs: <http://goo.gl/Or8cC>  
* A minimal working example: <http://goo.gl/fDLrq>

# Usage

`article-preamble.tex` should be `\input{}` in first line of your .tex file, e.g.:

    \input{article-preamble.tex} 
    \title{My article title}
    \published{Forthcoming in the \emph{The Journal}}
    \doi{10.1001/abcd/abc001}

    \begin{document}
    ...
    \end{document}


# Useful commands

`\title{...}`:			document title  
`\date{...}`:			document date---if absent: use `\gitAuthorDate`  
`\published{...}`:	publication info---if absent: show 'Draft only'  
`\doi{...}`:				document DOI  
`\headers{}`:			suppress running headers (useful for short documents)  

# Prerequisites

1. A modern LaTeX installation
2. Minion Pro fonts: <http://goo.gl/lQqMy>
3. Biblatex
4. The `gitinfo` package

# Acknowledgements

Borrows from many sources, most notably Kieran Healy's design:
<https://github.com/kjhealy/latex-custom-kjh>
