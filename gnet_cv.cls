\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gnet_cv}[2017/11/22 Custom CV class of Sebastian Geisler]

\LoadClass{article}
\RequirePackage{titlesec}
\RequirePackage{eqparbox}
\RequirePackage{array}
\RequirePackage{tabularx}

\pagenumbering{gobble}

\titleformat{\section}         % Customise the \section command 
  {\large\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
[\titlerule] % Inserts a horizontal line after the heading

\titleformat{\subsection}
  {\scshape\raggedright}
  {}{0em}
{}

\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}

\newcommand{\name}[1]{
  \centerline{\Huge{#1}}
}

\newcommand{\contact}[6]{
    \center{#1 {\large\textperiodcentered} #2 {\large\textperiodcentered} #3}
    \center{{\Large} \texttt{#4} \ {\Large} #5}
    \center{\texttt{\scriptsize #6}}
}

\newcolumntype{L}[1]{>{\begin{lrbox}{\csname#1box\endcsname}}r%
  <{\end{lrbox}\eqmakebox[#1][l]{\unhcopy\csname#1box\endcsname\strut}}}
\newsavebox{\mylheadbox}
\newlength{\mylheadwd}
\makeatletter
\AtBeginDocument{\setlength{\mylheadwd}{%
  \@ifundefined{eqp@this@mylhead}{0pt}{\eqp@this@mylhead}}}
\makeatother

\newcommand{\cvtable}[1]{
\begin{tabularx}{\textwidth}{L{mylhead} l}
    #1                                                
\end{tabularx}
}