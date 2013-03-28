% TODO pass font size as option
%% Article-like class
%%
%% by Mark Sprevak, University of Edinburgh
%% <mark.sprevak@ed.ac.uk>
%%
%% README: <https://github.com/msprev/mds-article/README.md>
%% Most recent version: <https://github.com/msprev/mds-article> 
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mds-article}[2013/03/21 mds-article class]

\DeclareOption{short}{
  \def\@setnoheaders{true}
}
\ProcessOptions\relax

%% mds-article.def: Load definitions file
%% If mds-article.def cannot be found use the default definition below
\InputIfFileExists{mds-article.def}{\relax}{
  \ClassWarningNoLine{mds-article}{mds-article.def not found, reverting to class default definitions}
  \def\myauthor{David Hume}
  \def\myaffiliation{University of Edinburgh}
  \def\myemail{david.hume@ed.ac.uk}
  \def\mybibfile{}
  \def\mylocalisation{british}
  \def\mypapersize{a4paper}
  \def\myfontsize{10pt}
  \def\mytitlestyle{\Huge\bfseries}
}

\LoadClass[oneside,\myfontsize]{article}
\RequirePackage{fixltx2e}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[\mypapersize]{geometry}
\ifdefined\loadmainfont   \loadmainfont   \fi
\ifdefined\loadmonofont   \loadmonofont   \fi
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage{enumitem}
\RequirePackage{titling}
\RequirePackage{gitinfo}
\RequirePackage[small,pagestyles]{titlesec}
\RequirePackage[\mylocalisation,cleanlook]{isodate}
\RequirePackage[\mylocalisation]{babel}
\RequirePackage[autostyle]{csquotes}
\RequirePackage[babel]{microtype}

%% Bibliography: biblatex
\RequirePackage[useprefix,authordate,natbib,sortcites,backend=biber]{biblatex-chicago}
\addbibresource{\mybibfile}
\setlength\bibitemsep{6pt}
\defbibheading{bibliography}[\refname]{\section*{#1} \sectionmark{#1}}
\defbibheading{references}[\refname]{\section*{#1} \sectionmark{#1}}

\geometry{
  top=2.5cm,
  bottom=3.5cm,
  headheight=3ex,
  headsep=3ex
}

%% Title page
%%
%% Center footer: page number
%% Right header:  email address
%% Left header:   publication info/'Draft only', DOI if \doi{..} set
%% \review:       set book review info below title, author, date
%% \authorblock:  set author & affliations
\newcommand{\email}[1]{\def\myemail{#1}}
\newcommand{\published}[1]{\def\@publicationinfo{#1}}
\newcommand{\doi}[1]{\def\@doiinfo{#1}}
\newcommand{\review}[1]{\def\@reviewinfo{#1}}
\newcommand{\authorblock}[1]{\def\@authorblockinfo{#1}}

\newcommand{\@doilink}[1]{\par\texttt{\href{http://dx.doi.org/#1}{doi:#1}}}
\newcommand{\@emaillink}[1]{\texttt{\href{mailto:#1}{#1}}}
\newcommand{\@emailinsert}{\@emaillink{\myemail}}

\renewpagestyle{plain}{
  \setfoot{}{\thepage}{}
  \sethead{\usebox{\@publicationbox}}{}{\usebox{\@emailbox}}
}

%% Header: running headers
%%
%% Center footer: page number
%% Right header:  subsection title
%% Left header:   section number and title
\newpagestyle{fancy}{
  \headrule
  \setfoot{}{\thepage}{}
  \sethead{\small \thesection \quad \sectiontitle}{}{\small \subsectiontitle}
}
\pagestyle{fancy}

%% Section titles: sub-subsection headings italic
\titleformat{\subsubsection}
{\itshape\normalsize}{\thesubsubsection}{1em}{}

%% Text can stretch a little into margins to avoid bad line-breaks
\setlength{\emergencystretch}{3em}

%% Footnotes: stay on the same page
\interfootnotelinepenalty=10000

%% Dark purple for hyperlinks
\definecolor{purple_link}{RGB}{76, 64, 133}

\RequirePackage[
  plainpages = false,
  pdfpagelabels,
  bookmarksnumbered,
  pdftex,
  colorlinks = true,
  citecolor  = purple_link,
  linkcolor  = purple_link,
  urlcolor   = purple_link
]{hyperref}

%% Description labels: bold, small caps, and enforced lowercase
%% Description: move to next line if label is too long
\renewcommand{\descriptionlabel}[1]{\hspace*{\labelsep}\textsc{\textbf{\MakeLowercase{#1}}}}
\setlist[description]{style=nextline}

%% \signed{...}: flush right, newline when necessary
%% usage: \signed{\citep{Lewis00}} 
\def\signed #1{{\leavevmode\unskip\nobreak\hfil\penalty50\hskip2em
  \hbox{}\nobreak\hfil#1%
  \parfillskip=0pt \finalhyphendemerits=0 \endgraf}}

%% \thesis{...}: typeset as the name of a claim, in small caps
\newcommand{\thesis}[1]{\mbox{\textsc{\MakeLowercase{#1}}}}

%% nsquote environment: quote with less space (copied from savetrees.sty)
%% used for abstract and review layout
\newenvironment{nsquote}
               {\list{}{\listparindent=0pt%
                        \itemindent    \listparindent%
                        \leftmargin=2em%
                        \rightmargin=2em%
                        \topsep=0pt%
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}

%% nstabbing: tabbing with no vertical space before & after
%% used for author and affliation layout
\newenvironment{nstabbing}
  {\setlength{\topsep}{0pt}%
   \setlength{\partopsep}{0pt}%
   \tabbing}
  {\endtabbing}

%% Title, author, and institution
\pretitle{\par\vskip\@pretitlespace\begin{flushleft}\mytitlestyle}
\posttitle{\end{flushleft}\par\vskip 0.5em}
\preauthor{\begin{flushleft}\normalsize\bigskip}
\postauthor{\end{flushleft}}
\predate{\begin{flushleft}\normalsize}
\postdate{\end{flushleft}\@reviewinfoinsert}

\authorblock{\myauthor\\
             \emph{\myaffiliation}}
\published{\emph{Draft only. Please do not cite without permission.}}

%% Date
%% \gitAuthorDate set: set that as the date
%% Otherwise: set '(None)' as the date
%% This is overridden if \date{...} set manually in document
\ifnum\pdfstrcmp{\gitAuthorDate}{(None)}=0 
  \date{\gitAuthorDate}
\else
  \date{\printdate{\gitAuthorDate}}
\fi

%% Abstract: minimal quote environment
\renewenvironment{abstract}{\begin{nsquote}\small}{\end{nsquote}}

%% Inserted before \begin{document}
\AtBeginDocument{

  %% Metadata in output PDF: title and author
  \hypersetup{
    pdftitle = {\thetitle},
    pdfauthor = {\myauthor}
  }

  %% \@doiinsert: formatted DOI link as set by \doi{}
  \ifdefined\@doiinfo
    \newcommand{\@doiinsert}{\@doilink{\@doiinfo}}
  \else
    \newcommand{\@doiinsert}{\relax}
  \fi

  %% \@emailbox: email info layout as set by \email{} and \myemail
  \newsavebox{\@emailbox}
  \savebox{\@emailbox}{\parbox[t]{.3\textwidth}{%
    \footnotesize \strut \hfill \@emailinsert}%
  }
  
  %% \@publicationbox: publication info layout as set by \published{}
  \newsavebox{\@publicationbox}
  \savebox{\@publicationbox}{\parbox[t]{.7\textwidth}{%
    \footnotesize \strut \@publicationinfo \@doiinsert}%
  }

  %% \@pretitlespace defaults is 5em, but extra space is added
  %% if \@publicationbox is taller than 3 lines 
  \newlength{\@pretitlespace}  \setlength{\@pretitlespace}{5em}
  \newlength{\@displacement}
  \setlength{\@displacement}{%
    \maxof{\ht\@publicationbox + \dp\@publicationbox - 3 \baselineskip}{0pt}%
  }
  \addtolength{\@pretitlespace}{\@displacement}

  %% \@authorbox: author & affliation layout as set by \authorblock{}
  \newsavebox{\@authorbox}
  \savebox{\@authorbox}{\parbox{\textwidth}{%
    \begin{nstabbing} \@authorblockinfo \end{nstabbing}}%
  }
  \author{\vspace{3pt} \usebox{\@authorbox} \vspace{1pt}}

  %% \@reviewinfo: information on the book being reviewed as set by \review{}
  \ifdefined\@reviewinfo
    \newcommand{\@reviewinfoinsert}{
      \vspace{0.5em}
      \begin{nsquote} \footnotesize \@reviewinfo \end{nsquote}
      \vspace{-1em}
    }
  \else
    \newcommand{\@reviewinfoinsert}{\relax}
  \fi
  
  \maketitle

  %% [short] option suppresses running headers
  \ifdefined\@setnoheaders
    \sethead{}{}{}
    \setheadrule{0pt}
  \fi

  %% Typesetting defaults for rest of document
  %% Paragraphs: don't indent first line
  %% Paragraphs: add small space to separate paragraphs
  \setlength{\parindent}{0pt}
  \setlength{\parskip}{6pt plus 2pt minus 1pt}
}

%% Inserted before \end{document}
\AtEndDocument{
  
  %% [short] option suppresses running headers
  \ifdefined\@setnoheaders
    \relax
  \else
    \sethead{\small \sectiontitle}{}{}
  \fi
    
  %% Bibliography: biblatex
  \printbibliography
  
  %% Git date and commit hash: print if set, otherwise do nothing
  \ifnum\pdfstrcmp{\gitAuthorDate}{(None)}=0 
    \relax 
  \else
    \flushright{\sffamily \scriptsize \gitAbbrevHash\ on \gitAuthorDate}
  \fi
  
}
