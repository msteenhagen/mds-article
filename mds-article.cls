% TODO move defaults into separate definition file
%%
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
  \def\mysectiontitlesize{small}
}
\def\mysectiontitlesize{big}
\ProcessOptions\relax
   
%% ==========================================================
%% Change these defaults as appropriate
%%
\def\myauthor{Mark Sprevak}
\def\myaffiliation{University of Edinburgh}
\def\myemail{mark.sprevak@ed.ac.uk}
\def\mybibfile{refs.bib}
\def\mylocalisation{british}
\def\mypapersize{a4paper}
%% MinionPro: remove `opticals` and `fullfamily` if you don't have full font
\def\loadmainfont{\RequirePackage[opticals,fullfamily,mathlf,minionint,footnotefigures]{MinionPro}}
\def\loadmonofont{\RequirePackage[scaled=0.85]{inconsolata}}
\def\myfontsize{11pt}
\def\mytitlestyle{\Huge\bfseries}
%%
%% ==========================================================


\LoadClass[oneside,\myfontsize]{article}
\RequirePackage{fixltx2e}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[\mypapersize,showframe]{geometry}
\ifdefined\loadmainfont   \loadmainfont   \fi
\ifdefined\loadmonofont   \loadmonofont   \fi
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage{enumitem}
\RequirePackage{titling}
\RequirePackage{gitinfo}
\RequirePackage[\mysectiontitlesize,pagestyles]{titlesec}
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
  headsep=2.75ex
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

%% Quote environment: take up less space (copied from savetrees.sty)
\renewenvironment{quote}
               {\list{}{\listparindent=0pt%
                        \itemindent    \listparindent
                        \leftmargin=2em%
                        \rightmargin=2em%
                        \topsep=0pt%
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}

%% \signed{...}: flush right, newline when necessary
%% usage: \signed{\citep{Lewis00}} 
\def\signed #1{{\leavevmode\unskip\nobreak\hfil\penalty50\hskip2em
  \hbox{}\nobreak\hfil#1%
  \parfillskip=0pt \finalhyphendemerits=0 \endgraf}}

%% aquote environment: quote with citation flush right, newline when necessary
%% usage: begin{aquote}{\citep{Lewis00}} ... \end{aquote} 
\newsavebox\@mybox
\newenvironment{aquote}[1]
  {\savebox\@mybox{#1}\begin{quote}}
  {\signed{\usebox\@mybox}\end{quote}}

%% nstabbing: tabbing with extra vertical space before & after removed
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

%% Abstract: plain quote environment
\renewenvironment{abstract}{\begin{quote}\small}{\end{quote}}

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
  
  %% \@emailbox: email info layout as set by \myemail
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
      \begin{quote} \footnotesize \@reviewinfo \end{quote}
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
