
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
    pdfborder={0 0 1},
    linkbordercolor={0 0 1},
    citebordercolor={1 0 0},
    urlbordercolor={0 1 0},
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
\renewcommand{\headrulewidth}{0.4pt} % 页眉横线
\renewcommand{\footrulewidth}{0pt} % 移除页脚线
\chead{\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{12.6pt}\selectfont\cpipc@tokens@title} % 页眉居中显示项目名称，宋体五号
\cfoot{\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{12.6pt}\selectfont\thepage} % 页脚居中，宋体五号

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
  % 首页特殊边距设置：上1.50cm，下1.75cm
  \newgeometry{top=1.50cm,bottom=1.75cm,left=3.17cm,right=3.17cm}
  \thispagestyle{plain} % 首页有页脚但无页眉
  \fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \cfoot{\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{12.6pt}\selectfont\thepage}
  }
  
  % 从页面顶部空4行开始
  \vspace*{4\baselineskip}
  \begin{center}
    % 第七届中国研究生人工智能创新大赛：方正小标宋简体 二号 加粗 行距1.25倍
    {\TitleCJK\fontsize{22pt}{27.5pt}\selectfont\bfseries \cpipc@competition@title\par}
    
    % 空10行
    \vspace{10\baselineskip}
    
    % [项目名称]：times、宋体 小二 加粗 行距1.25
    {\setmainfont{\AI@LatinMain}\CJKfamily{\AI@CJKMain}\fontsize{18pt}{22.5pt}\selectfont\bfseries [\cpipc@tokens@title]\par}
    
    % 空1行
    \vspace{1\baselineskip}
    
    % 项目文档：宋体 小二 加粗 行距1.25
    {\CJKfamily{\AI@CJKMain}\fontsize{18pt}{22.5pt}\selectfont\bfseries 项目文档\par}
    
    % 空0行
    % 版本号码：times、宋体 小四 加粗 行距1.25
    {\setmainfont{\AI@LatinMain}\CJKfamily{\AI@CJKMain}\fontsize{12pt}{15pt}\selectfont\bfseries 版本号码：\cpipc@tokens@version\par}
    
    % 空0行
    % [YYYY.MM.DD]、[团队名称]、[参赛组别]：times、宋体 小四 加粗 行距1.25 前3行中0行
    {\setmainfont{\AI@LatinMain}\CJKfamily{\AI@CJKMain}\fontsize{12pt}{15pt}\selectfont\bfseries [\cpipc@tokens@teamname]\par}
    {\setmainfont{\AI@LatinMain}\CJKfamily{\AI@CJKMain}\fontsize{12pt}{15pt}\selectfont\bfseries [\cpipc@tokens@category]\par}
  \end{center}
  \vfill
  \clearpage
  \restoregeometry % 恢复正常页面边距
}

%% TOC styling 
% 目录标题：宋体 二号 行距2.4
\renewcommand{\cfttoctitlefont}{\hfill\CJKfamily{\AI@CJKMain}\fontsize{22pt}{28.8pt}\selectfont\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftaftertoctitleskip}{12pt} % 控制标题后间距

% 目录内容：中文宋体 别的times 五号 1级标题加粗 1.1级不加粗 单倍行距
\renewcommand{\cftsecdotsep}{4.5}
\setlength{\cftbeforesecskip}{3pt}
\setlength{\cftbeforesubsecskip}{0pt}
% 一级标题：宋体五号加粗
\renewcommand{\cftsecfont}{\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{10.5pt}\selectfont\bfseries}
\renewcommand{\cftsecpagefont}{\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{10.5pt}\selectfont\bfseries}
% 二级标题：宋体五号不加粗
\renewcommand{\cftsubsecfont}{\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{10.5pt}\selectfont}
\renewcommand{\cftsubsecpagefont}{\CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{10.5pt}\selectfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecaftersnumb}{\hskip.4em}

%% 目录命令
\newcommand{\makemycontents}{%
  \thispagestyle{fancy} % 确保目录页有页眉
  \tableofcontents
  \clearpage
}

%% Change history section
%% 记录更改历史：宋体 三号 加粗 居中
\newcommand{\changehistory}{%
  \thispagestyle{fancy}% 记录更改历史页有页眉页脚
  % 标题：宋体 三号 加粗 居中
  \begin{center}
  {\CJKfamily{\AI@CJKMain}\fontsize{16pt}{16pt}\selectfont\bfseries 记录更改历史}
  \end{center}
  \vspace{12pt}
  % 表格：全线表 0.5磅 宋体 五号 居中；表头加粗 居中 段前段后1.54 单倍行距
  \setlength{\arrayrulewidth}{0.5pt}
  \renewcommand{\arraystretch}{1.0}
  \begin{center}
  \vspace{1.54pt}
  \begin{tabularx}{\textwidth}{|c|X|c|c|c|c|}
  \hline
  % 表头：宋体 五号 加粗 居中
  \CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{10.5pt}\selectfont 序号 &
  \CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{10.5pt}\selectfont 更改原因 &
  \CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{10.5pt}\selectfont 版本 &
  \CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{10.5pt}\selectfont 作者 &
  \CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{10.5pt}\selectfont 更改日期 &
  \CJKfamily{\AI@CJKMain}\bfseries\fontsize{10.5pt}{10.5pt}\selectfont 备注 \\ \hline
  % 表格内容：宋体 五号 居中
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{10.5pt}\selectfont 1 &
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{10.5pt}\selectfont 初始化 &
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{10.5pt}\selectfont V0.1 &
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{10.5pt}\selectfont 张三 &
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{10.5pt}\selectfont 2025.08.27 &
  \CJKfamily{\AI@CJKMain}\fontsize{10.5pt}{10.5pt}\selectfont — \\ \hline
  \end{tabularx}
  \vspace{1.54pt}
  \end{center}
  \clearpage
}

%% Headings for 正文
% 1 项目概况：宋体 三号 加粗 一级大纲 不缩进 行距1.5
\titleformat{\section}{\CJKfamily{\AI@CJKMain}\bfseries\fontsize{16pt}{24pt}\selectfont}{\thesection}{0.8em}{}
\titlespacing*{\section}{0pt}{12pt}{6pt}

% 1.1 背景和基础：宋体 四号 加粗 二级大纲 不缩进 行距1.5  
\titleformat{\subsection}{\CJKfamily{\AI@CJKMain}\bfseries\fontsize{14pt}{21pt}\selectfont}{\thesubsection}{0.6em}{}
\titlespacing*{\subsection}{0pt}{12pt}{6pt}

%% Helper to switch page numbering after 3 pages
\newcounter{cpipc@frontpages}\setcounter{cpipc@frontpages}{3}
\AtBeginDocument{%
  \pagenumbering{Roman}% 前三页使用大写罗马数字
  \setcounter{page}{1}% 从I开始
  % 设置正文基本格式：宋体 五号 正文 两端对齐 行距1.5
  \CJKfamily{\AI@CJKMain}
  \fontsize{10.5pt}{15.75pt}\selectfont
  \setstretch{1.5}
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
% 确保所有段落都缩进，包括首段
\RequirePackage{indentfirst}

%% End of class
