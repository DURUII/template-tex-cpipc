
%% ai-innovation.cls — XeLaTeX class for 第七届中国研究生人工智能创新大赛 项目文档
%% Requires: xelatex, fontspec, xeCJK
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ai-innovation}[2025/08/27 v1.0 Project doc class]

\LoadClass[a4paper,12pt]{article}

%% Packages
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
\RequirePackage{hyperref}
\hypersetup{colorlinks=false, pdfborder={0 0 0}}
\RequirePackage{ragged2e}

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

%% User-settable meta
\newcommand{\ProjectName}{项目名称}
\newcommand{\ProjectVersion}{V0.1}
\newcommand{\ProjectDate}{YYYY.MM.DD}
\newcommand{\TeamName}{团队名称}
\newcommand{\CategoryName}{参赛组别}
\newcommand{\CompetitionName}{第七届中国研究生人工智能创新大赛}

%% Interfaces for user
\newcommand{\setprojectname}[1]{\renewcommand{\ProjectName}{#1}}
\newcommand{\setversion}[1]{\renewcommand{\ProjectVersion}{#1}}
\newcommand{\setprojectdate}[1]{\renewcommand{\ProjectDate}{#1}}
\newcommand{\setteam}[1]{\renewcommand{\TeamName}{#1}}
\newcommand{\setcategory}[1]{\renewcommand{\CategoryName}{#1}}
\newcommand{\setcompetitionname}[1]{\renewcommand{\CompetitionName}{#1}}

%% Footer: page numbers — 前三页罗马数字，后面阿拉伯数字
%% Header: 项目名称
\pagestyle{fancy}
\fancyhf{} % clear
\chead{\ProjectName} % 页眉居中显示项目名称
\cfoot{\thepage}

%% Title page generator
\newcommand{\maketitlepage}{%
  \thispagestyle{empty}% 首页无页眉页脚
  % 页面上边距1.50cm、下边距1.75cm 起始位置控制（相对版心）
  \newgeometry{top=1.50cm,bottom=1.75cm,left=3.17cm,right=3.17cm}% 首页特殊边距
  \vspace*{4\baselineskip}% 和最上面空4行
  \begin{center}
    \AI@linespaceonetwofive
    {\TitleCJK\fontsize{22.0pt}{27.5pt}\selectfont\bfseries \CompetitionName\par}% 方正小标宋简体 二号 加粗 行距1.25倍
    \vspace{10\baselineskip}% 空10行
    {\CJKfamily{\AI@CJKMain}\fontsize{18.0pt}{22.5pt}\selectfont\bfseries [\ProjectName]\par}% [项目名称] Times、宋体 小二 加粗 行距1.25
    \vspace{1\baselineskip}% 空1行
    {\CJKfamily{\AI@CJKMain}\fontsize{18.0pt}{22.5pt}\selectfont\bfseries 项目文档\par}% 宋体 小二 加粗 行距1.25
    \vspace{0pt}% 空0行
    {\fontsize{12.0pt}{15.0pt}\selectfont\bfseries 版本号码：[\ProjectVersion]\par}% Times、宋体 小四 加粗 行距1.25
    \vspace{0pt}% 空0行
    {\fontsize{12.0pt}{15.0pt}\selectfont\bfseries [\ProjectDate]\par}% 前3行中空0行
    {\fontsize{12.0pt}{15.0pt}\selectfont\bfseries [\TeamName]\par}
    {\fontsize{12.0pt}{15.0pt}\selectfont\bfseries [\CategoryName]\par}
  \end{center}
  \clearpage
  \restoregeometry% 恢复正常页面边距
}

%% TOC styling
%% "目录" 标题：宋体 二号 行距2.4
\newcommand{\makemycontents}{%
  \thispagestyle{fancy}% 目录页有页眉页脚
  \AI@linespacetwofour
  {\centering \CJKfamily{\AI@CJKMain}\fontsize{22.0pt}{26pt}\selectfont 目录\par}
  \vspace{0.8\baselineskip}
  \AI@linespaceone
  \renewcommand{\cftsecdotsep}{\cftdotsep} % leader dots
  \renewcommand{\cftbeforesecskip}{4pt}
  \renewcommand{\cftsecfont}{\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{14pt}\selectfont\bfseries} % 五号，1级加粗
  \renewcommand{\cftsecpagefont}{\cftsecfont}
  \renewcommand{\cftsubsecfont}{\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{14pt}\selectfont} % 1.1级不加粗
  \renewcommand{\cftsubsecpagefont}{\cftsubsecfont}
  \tableofcontents
  \clearpage
}

%% Change history section
%% 记录更改历史：宋体 三号 加粗 居中 行距单倍
\newcommand{\changehistory}{%
  \thispagestyle{fancy}% 记录更改历史页有页眉页脚
  \AI@linespaceone
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
\titleformat{\section}{\AI@linespaceonefive\CJKfamily{\AI@CJKMain}\bfseries\fontsize{16pt}{24pt}\selectfont}{\thesection}{0.8em}{}[\vspace{-12pt}]
\titlespacing*{\section}{0pt}{12pt}{6pt}

%% 1.1 背景和基础：宋体 四号 加粗 二级大纲 不缩进 行距1.5
\titleformat{\subsection}{\AI@linespaceonefive\CJKfamily{\AI@CJKMain}\bfseries\fontsize{14pt}{21pt}\selectfont}{\thesubsection}{0.6em}{}[\vspace{-12pt}]
\titlespacing*{\subsection}{0pt}{12pt}{6pt}

%% 正文：宋体 五号 正文 两端对齐 行距1.5
\newcommand{\BodyText}{\AI@linespaceonefive\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{15.75pt}\selectfont\justifying}

%% 段落缩进控制：第一段不缩进，后续段落缩进
\newcommand{\FirstParagraph}{\noindent}
\newcommand{\NextParagraph}{\par\indent}

%% Helper to switch page numbering after 3 pages
\newcounter{AI@frontpages}\setcounter{AI@frontpages}{3}
\AtBeginDocument{%
  \pagenumbering{roman}% 前三页使用罗马数字
  \setcounter{page}{1}% 从i开始
}
\newcommand{\startmain}{%
  \clearpage
  \pagenumbering{arabic}% 正文开始使用阿拉伯数字
  \setcounter{page}{1}% 重新从1开始
}

%% Ensure TOC fonts are CJK/TNR mixed via main font settings (xeCJK takes care of CJK vs Latin)

%% Paragraph indent etc.
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}

%% End of class
