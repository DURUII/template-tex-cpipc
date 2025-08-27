
%% cpipc.cls — XeLaTeX class for 第七届中国研究生人工智能创新大赛
%% Requires: xelatex, fontspec, xeCJK
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cpipc}[2025/01/10 v1.0 CPIPC Competition Template]

\LoadClass[a4paper,12pt]{article}

%% Packages (based on cumcmthesis)
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{fancyhdr}
\RequirePackage{tocloft}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{bigstrut}
\RequirePackage{bigdelim}
\RequirePackage{ulem}
\RequirePackage{calc}
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}

%% Hyperref setup
\hypersetup{%
    pdfstartview=FitH,
    CJKbookmarks=true,
    bookmarksnumbered=true,
    bookmarksopen=true,
    colorlinks=false,
    pdfborder={0 0 0},
    allcolors=black,
    breaklinks=true
}

%% Geometry: 页边距：上2.54 下2.54 左3.17 右3.17 cm
\geometry{top=2.54cm,bottom=2.54cm,left=3.17cm,right=3.17cm,headheight=14pt,headsep=12pt,footskip=18pt}

%% Fonts
%% Options allow overriding font names if needed
% \newcommand{\AI@CJKMain}{SimSun} % 宋体
% \newcommand{\AI@TitleCJK}{FZXiaoBiaoSong-B05S} % 方正小标宋简体（常见 PostScript 名称之一）
\newcommand{\AI@LatinMain}{Times New Roman}

\newcommand{\AI@CJKMain}{Noto Serif CJK SC}
\newcommand{\AI@TitleCJK}{Noto Serif CJK SC}

\DeclareOption{cjkmainfont}{\renewcommand{\AI@CJKMain}{\CurrentOption}}
\DeclareOption{latinfont}{\renewcommand{\AI@LatinMain}{\CurrentOption}}
\DeclareOption{titlecjkfont}{\renewcommand{\AI@TitleCJK}{\CurrentOption}}
\ProcessOptions\relax

\setmainfont{\AI@LatinMain}
\setCJKmainfont[BoldFont=\AI@CJKMain]{\AI@CJKMain}
\newCJKfontfamily\TitleCJK{\AI@TitleCJK}
%% Fallback: if title font missing, fall back to 宋体
\IfFontExistsTF{\AI@TitleCJK}{}{\renewcommand{\TitleCJK}{\CJKfamily{\AI@CJKMain}}}

%% Line spacing helpers
\newcommand{\AI@linespaceone}{\setstretch{1.0}}
\newcommand{\AI@linespaceonetwofive}{\setstretch{1.25}}
\newcommand{\AI@linespaceonefive}{\setstretch{1.5}}
\newcommand{\AI@linespacetwofour}{\setstretch{2.4}}

%% Token definitions (similar to cumcmthesis)
\newcommand\cpipc@tokens@title{}
\newcommand*\cpipc@tokens@version{}
\newcommand*\cpipc@tokens@teamname{}
\newcommand*\cpipc@tokens@category{}

%% User interfaces for setting tokens
\renewcommand*\title[1]{\renewcommand{\cpipc@tokens@title}{#1}}
\newcommand*\version[1]{\renewcommand{\cpipc@tokens@version}{#1}}
\newcommand*\teamname[1]{\renewcommand{\cpipc@tokens@teamname}{#1}}
\newcommand*\category[1]{\renewcommand{\cpipc@tokens@category}{#1}}

%% Competition title
\newcommand*{\cpipc@competition@title}{第七届中国研究生人工智能创新大赛}

%% Chinese title names (similar to cumcmthesis)
\newcommand*{\cpipc@cap@contentsname}{目录}
\newcommand*{\cpipc@cap@refname}{参考文献}

%% Set Chinese names
\renewcommand\contentsname{\cpipc@cap@contentsname}
\renewcommand\refname{\cpipc@cap@refname}

%% Page style setup
\pagestyle{fancy}
\fancyhf{} % clear
\chead{\cpipc@tokens@title} % 页眉居中显示项目名称
\cfoot{\thepage}

% Redefine \maketitle command (similar to cumcmthesis)
\renewcommand{\maketitle}{\par
	\begingroup
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \endgroup
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\def\@maketitle{%
  \newpage
  \null
  \thispagestyle{empty}
  % Title page layout matching figure 2
  \vspace*{5\baselineskip}
  \begin{center}
    % Competition title
    {\CJKfamily{\AI@CJKMain}\fontsize{16pt}{24pt}\selectfont\bfseries \cpipc@competition@title\par}
    \vspace{8\baselineskip}
    
    % Project title area
    {\CJKfamily{\AI@CJKMain}\fontsize{14pt}{21pt}\selectfont\bfseries [\cpipc@tokens@title]\par}
    \vspace{2\baselineskip}
    
    % Project document text
    {\CJKfamily{\AI@CJKMain}\fontsize{14pt}{21pt}\selectfont\bfseries 项目文档\par}
    \vspace{1\baselineskip}
    
    % Additional info
    {\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{15.75pt}\selectfont 版本号码：\cpipc@tokens@version\par}
    \vspace{0.5\baselineskip}
    
    {\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{15.75pt}\selectfont [\cpipc@tokens@teamname]\par}
    \vspace{0.3\baselineskip}
    
    {\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{15.75pt}\selectfont [\cpipc@tokens@category]\par}
  \end{center}
  \vfill
  \clearpage
}

%% TOC styling (参考cumcmthesis)
\renewcommand{\cftsecdotsep}{4.5}
\setlength{\cftbeforesecskip}{7pt}
\setlength{\cftbeforesubsecskip}{3pt}
\renewcommand{\cftsecfont}{\bfseries\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{14pt}\selectfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecaftersnumb}{\hskip.4em}

%% 简化的目录命令
\newcommand{\makemycontents}{%
  \tableofcontents
  \clearpage
}

%% Change history section
%% 记录更改历史：宋体 三号 加粗 居中 行距单倍
\newcommand{\changehistory}{%
  \thispagestyle{fancy}% 记录更改历史页有页眉页脚
  \setstretch{1.0}
  {\centering \CJKfamily{\AI@CJKMain}\fontsize{16.0pt}{20pt}\selectfont \bfseries 记录更改历史\par}
  \vspace{12pt}
  % 表格样式：全线表 0.5磅 宋体 五号 居中；表头加粗 居中 段前段后1.54 单倍行距
  \setlength{\arrayrulewidth}{0.5pt}
  \renewcommand{\arraystretch}{1.35}
  \begin{center}
  % 使用tabularx实现表格宽度铺满页面并按内容自适应
  \begin{tabularx}{\textwidth}{|c|X|c|c|c|c|}
  \hline
  \multicolumn{1}{|c|}{\CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{13pt}\selectfont 序号} &
  \multicolumn{1}{c|}{\CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{13pt}\selectfont 更改原因} &
  \multicolumn{1}{c|}{\CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{13pt}\selectfont 版本} &
  \multicolumn{1}{c|}{\CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{13pt}\selectfont 作者} &
  \multicolumn{1}{c|}{\CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{13pt}\selectfont 更改日期} &
  \multicolumn{1}{c|}{\CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{13pt}\selectfont 备注} \\ \hline
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{13pt}\selectfont 1 &
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{13pt}\selectfont 初始化 &
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{13pt}\selectfont V0.1 &
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{13pt}\selectfont 张三 &
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{13pt}\selectfont 2025.08.27 &
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{13pt}\selectfont — \\ \hline
  \end{tabularx}
  \end{center}
  \clearpage
}

%% Headings for 正文
%% 1 项目概况：宋体 三号 加粗 一级大纲 不缩进 行距1.5
\titleformat{\section}{\setstretch{1.5}\CJKfamily{\AI@CJKMain}\bfseries\fontsize{16pt}{24pt}\selectfont}{\thesection}{0.8em}{}[\vspace{-12pt}]
\titlespacing*{\section}{0pt}{12pt}{6pt}

%% 1.1 背景和基础：宋体 四号 加粗 二级大纲 不缩进 行距1.5
\titleformat{\subsection}{\setstretch{1.5}\CJKfamily{\AI@CJKMain}\bfseries\fontsize{14pt}{21pt}\selectfont}{\thesubsection}{0.6em}{}[\vspace{-12pt}]
\titlespacing*{\subsection}{0pt}{12pt}{6pt}

%% 正文样式已移除，使用标准LaTeX命令

%% Helper to switch page numbering after 3 pages
\newcounter{cpipc@frontpages}\setcounter{cpipc@frontpages}{3}
\AtBeginDocument{%
  \pagenumbering{Roman}% 前三页使用大写罗马数字
  \setcounter{page}{1}% 从I开始
}
\newcommand{\startmain}{%
  \clearpage
  \pagenumbering{arabic}% 正文开始使用阿拉伯数字
  \setcounter{page}{1}% 重新从1开始
}

%% Bibliography settings for BibTeX support
\RequirePackage{etoolbox}
\AtBeginEnvironment{thebibliography}{%
    \phantomsection
    % 只有当\refname不为空时才添加到目录
    \ifx\refname\empty\else
        \addcontentsline{toc}{section}{\refname}
    \fi
}

%% Paragraph indent etc.
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}

%% End of class
