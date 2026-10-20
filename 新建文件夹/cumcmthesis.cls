\NeedsTeXFormat{LaTeX2e}[1995/12/01] % 指定所需的 LaTeX 格式版本
\ProvidesClass{cumcmthesis}
              [2017/09/16 v2.6 Standard LaTeX Template for CUMCM] % 提供一个类文件，并声明其名称、日期、版本和描述

%% Inital Code
% 初始代码区

% 定义一个新的布尔开关（if判断） \if@mcm@bwprint，用于控制是否为黑白打印
% 默认将其设置为 false (黑白打印关闭，即彩色打印)
\newif\if@mcm@bwprint\@mcm@bwprintfalse 

% 定义一个新的布尔开关 \if@mcm@preface，用于控制是否显示封面页（承诺书和编号页）
% 默认将其设置为 true (显示封面页)
\newif\if@mcm@preface\@mcm@prefacetrue

% ---
% --- 用户请求：注释掉封面页 ---
% --- 通过将 \@mcm@preface 开关强制设为 false，可以禁用承诺书和编号专用页的生成
\@mcm@prefacefalse
% ---

% tokens definition
% 定义用于存储封面页信息的宏（tokens）
%%%% 承诺书
\newcommand\mcm@tokens@keywords{} % 关键字
\newcommand*\mcm@tokens@tihao{} % 题号
\newcommand*\mcm@tokens@baominghao{} % 报名号
\newcommand*\mcm@tokens@schoolname{} % 学校名称
\newcommand*\mcm@tokens@membera{} % 队员A
\newcommand*\mcm@tokens@memberb{} % 队员B
\newcommand*\mcm@tokens@memberc{} % 队员C
\newcommand*\mcm@tokens@supervisor{} % 指导教师
\newcommand*\mcm@tokens@yearinput{} % 年
\newcommand*\mcm@tokens@monthinput{} % 月
\newcommand*\mcm@tokens@dayinput{} % 日
%%%% 编号专用页
% 没有 (此行为原文件注释)

%% Declaration of Options
% 声明类选项
\DeclareOption{colorprint}{\@mcm@bwprintfalse} % 定义 'colorprint' 选项，效果是设置黑白打印为 false
\DeclareOption{bwprint}{\@mcm@bwprinttrue} % 定义 'bwprint' 选项，效果是设置黑白打印为 true
\DeclareOption{withoutpreface}{\@mcm@prefacefalse} % 定义 'withoutpreface' 选项，效果是设置显示封面页为 false
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % 将所有未被识别的选项传递给基类 'article'

%% Executing of Options
% 执行选项
\ExecuteOptions{colorprint} % 默认执行 'colorprint' 选项
\ProcessOptions\relax % 处理上面声明的选项

%% Loading Class
% 加载基类
\LoadClass[a4paper,12pt]{article} % 加载 'article' 类，并设置纸张为 a4，基础字号为 12pt

%% Loading Package
% 加载宏包
\RequirePackage{ifxetex} % 加载 'ifxetex' 宏包，用于判断是否使用 XeTeX 编译
\RequireXeTeX % 强制要求使用 XeTeX 进行编译
\ifxetex\else % 如果没有使用 XeTeX
\ClassError{mcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.} % 则报告一个类错误，提示用户必须使用 xelatex
\fi
% 支持中文的 ctex 宏包
\RequirePackage{ctex} % 加载 'ctex' 宏包，为中文排版提供全面支持
% 页面布局
\RequirePackage{geometry} % 加载 'geometry' 宏包，用于方便地设置页面边距
% 数学宏包
\RequirePackage{amsmath} % 加载 AMS 数学宏包，提供高级数学公式环境
\RequirePackage{amsfonts} % 加载 AMS 字体宏包
\RequirePackage{amssymb} % 加载 AMS 符号宏包
\RequirePackage{bm} % 加载 'bm' 宏包，用于排版数学公式中的粗体符号
\RequirePackage{titletoc} % 加载 'titletoc' 宏包，用于定制目录条目
% 设置颜色
\RequirePackage{xcolor} % 加载 'xcolor' 宏包，提供颜色支持
% 插入图片
\RequirePackage{graphicx} % 加载 'graphicx' 宏包，用于插入图片
% 表格
\RequirePackage{array} % 加载 'array' 宏包，提供对表格列格式的增强
%% 长表格
\RequirePackage{longtable} % 加载 'longtable' 宏包，支持跨页长表格
%% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs} % 加载 'booktabs' 宏包，提供高质量表格的三线表命令 (\toprule, \midrule, \bottomrule)
%% multirow 支持在表格中跨行
\RequirePackage{multirow} % 加载 'multirow' 宏包，用于在表格中创建跨多行的单元格
%% 调整间隔, 让表格更好看些
\RequirePackage{bigstrut} % 加载 'bigstrut' 宏包，用于在表格中微调行高
%% 在跨行表格中输入定界符
\RequirePackage{bigdelim} % 加载 'bigdelim' 宏包，用于在表格中创建跨多行的大型定界符
% 保护脆落命令
\RequirePackage{cprotect} % 加载 'cprotect' 宏包，用于保护“脆弱”命令（在特定环境内容易出错的命令）
% 设置代码环境
\RequirePackage{listings} % 加载 'listings' 宏包，用于排版代码
\RequirePackage{xcolor} % 再次加载 'xcolor' (通常无害，但此处重复)
%强制表格位置
\RequirePackage{float} % 加载 'float' 宏包，提供对浮动体位置的更精细控制

\RequirePackage[titles]{tocloft} % 加载 'tocloft' 宏包，用于自定义目录、图目录、表目录的样式
\renewcommand{\cftdot}{$\cdot$} % 将目录中条目和页码之间的填充符改为点 (·)
\renewcommand{\cftsecdotsep}{1.5} % 设置填充点之间的间隔
\setlength{\cftbeforesecskip}{7pt} % 设置目录中 "section" (章) 条目之前的垂直间距
\setlength{\cftbeforesubsecskip}{3pt} % 设置目录中 "subsection" (节) 条目之前的垂直间距
\renewcommand{\cftsecfont}{\zihao{-4}\songti} % section 字体宋体小四
\renewcommand{\cftsecpagefont}{\zihao{-4}\songti} % section 页码字体宋体小四
\renewcommand{\cftsubsecfont}{\zihao{-4}\songti} % subsection 字体宋体小四
\renewcommand{\cftsubsecpagefont}{\zihao{-4}\songti} % subsection 页码字体宋体小四
\renewcommand{\cftsubsubsecfont}{\zihao{-4}\songti} % subsubsection 字体宋体小四
\renewcommand{\cftsubsubsecpagefont}{\zihao{-4}\songti} % subsubsection 页码字体宋体小四
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}} % 设置 "section" 条目的引导线（点）
\renewcommand{\cftsecaftersnumb}{\hskip.4em} % 设置 "section" 条目编号后的水平间距

% 定义几个颜色
\definecolor{dkgreen}{rgb}{0,0.6,0} % 定义深绿色
\definecolor{gray}{rgb}{0.5,0.5,0.5} % 定义灰色
\definecolor{mauve}{rgb}{0.58,0,0.82} % 定义紫红色

% 全局设置 'listings' 宏包的样式
\lstset{
  frame=tb, % 'frame=tb' 表示在代码块的顶部(top)和底部(bottom)绘制边框
  aboveskip=3mm, % 代码块上方的间距
  belowskip=3mm, % 代码块下方的间距
  showstringspaces=false, % 不显示字符串中的空格（例如用特定符号标记）
  columns=flexible, % 灵活的列宽
  framerule=1pt, % 边框线的粗细
  rulecolor=\color{gray!35}, % 边框线的颜色（35%的灰色）
  backgroundcolor=\color{gray!5}, % 代码块的背景色（5%的灰色）
  basicstyle={\small\ttfamily}, % 基础字体样式（小号、打字机字体）
  numbers=none, % 不显示行号
  numberstyle=\tiny\color{gray}, % 行号的样式（如果开启的话）
  keywordstyle=\color{blue}, % 关键字的颜色（蓝色）
  commentstyle=\color{dkgreen}, % 注释的颜色（深绿色）
  stringstyle=\color{mauve}, % 字符串的颜色（紫红色）
  breaklines=true, % 自动折行
  breakatwhitespace=true, % 只在空白处折行
  tabsize=3, % Tab 键的宽度（相当于3个空格）
}
% 首行缩进
\RequirePackage{indentfirst} % 加载 'indentfirst' 宏包，使得章节标题后的第一个段落也首行缩进
% 设置浮动体的标题
\RequirePackage{caption} % 加载 'caption' 宏包，用于自定义图表的标题
% 定制列表环境
\RequirePackage{enumitem} % 加载 'enumitem' 宏包，提供对列表环境（enumerate, itemize）的精细控制
% 下划线
\RequirePackage{ulem} % 加载 'ulem' 宏包，提供下划线命令
% 尺寸计算
\RequirePackage{calc} % 加载 'calc' 宏包，允许在 LaTeX 命令参数中进行算术运算

% 加载 'appendix' 宏包，用于处理附录
\RequirePackage[titletoc,title]{appendix}
%\RequirePackage[title,toc,titletoc]{appendix} % (此行为原文件注释)

\RequirePackage{etoolbox} % 加载 'etoolbox' 宏包，提供一系列 TeX 编程工具
% 在 'thebibliography' (参考文献) 环境开始时执行...
\AtBeginEnvironment{thebibliography}{%
    \phantomsection % 添加一个“幽灵章节”，确保超链接能准确定位
    \addcontentsline{toc}{section}{\refname} % 将“参考文献”添加到目录中，级别为 section
    }
% 超链接 hyperref 的设置
\RequirePackage{hyperref} % 加载 'hyperref' 宏包，用于生成 PDF 内的超链接和书签
%% Document Layout
% 文档布局
% 页面布局
\geometry{top=25mm,bottom=25mm,left=25mm,right=25mm} % 使用 'geometry' 宏包设置页边距均为 25mm
\renewcommand*{\baselinestretch}{1.25} % 设置全局行距为 1.25 倍
% 修改tabular 环境, 设置表格中的行间距为正文行间距.
\let\mcm@oldtabular\tabular % 保存原始的 \tabular 命令
\let\mcm@endoldtabular\endtabular % 保存原始的 \endtabular 命令
\renewenvironment{tabular}% % 重定义 'tabular' 环境
	{\bgroup% % 开始一个分组
	\renewcommand{\arraystretch}{1.2}% % 在表格内部将行距拉伸因子设为 1.2
	\mcm@oldtabular}% % 调用原始的 \tabular 命令
	{\mcm@endoldtabular\egroup} % 调用原始的 \endtabular 命令，并结束分组
% 每行缩进两个汉字
\setlength\parindent{2em} % 设置段落首行缩进为 2 个 M 宽度（大致为2个汉字）
% 设置字体
\setmainfont{Times New Roman} % 设置西文主字体为 Times New Roman
%\setmonofont{Courier New} % (此行为原文件注释)
\setsansfont{Arial} % 设置西文无衬线字体为 Arial
% 定义一个名为 'kai' 的 CJK (中日韩) 字体族，使用 'simkai.ttf' (中易楷体) 字体文件
\setCJKfamilyfont{kai}[AutoFakeBold]{simkai.ttf} 
\newcommand*{\kai}{\CJKfamily{kai}} % 定义一个快捷命令 \kai 来切换到楷体
% 定义一个名为 'song' 的 CJK 字体族，使用 'SimSun' (中易宋体) 字体文件
\setCJKfamilyfont{song}[AutoFakeBold]{SimSun}
\newcommand*{\song}{\CJKfamily{song}} % 定义一个快捷命令 \song 来切换到宋体

% 重定义标准字号 \normalsize
\renewcommand\normalsize{%
	\zihao{-4}\songti% % 明确使用小四号字体和宋体
	\abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@ % 设置公式上方的间距
	\abovedisplayshortskip \z@ \@plus3\p@ % 设置短公式上方的间距
	\belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@} % 设置短公式下方的间距
% 数学环境, 定理等设置
% 定义一系列定理类环境
\newtheorem{definition}{\mcm@cap@definition} % 定义 (名称来自 \mcm@cap@definition)
\newtheorem{theorem}{\mcm@cap@theorem} % 定理
\newtheorem{lemma}{\mcm@cap@lemma} % 引理
\newtheorem{corollary}{\mcm@cap@corollary} % 推论
\newtheorem{assumption}{\mcm@cap@assumption} % 假设
\newtheorem{conjecture}{\mcm@cap@conjecture} % 猜想
\newtheorem{axiom}{\mcm@cap@axiom} % 公理
\newtheorem{principle}{\mcm@cap@principle} % 定律
\newtheorem{problem}{\mcm@cap@problem} % 问题
\newtheorem{example}{\mcm@cap@example} % 例
\newtheorem{proof}{\mcm@cap@proof} % 证明
\newtheorem{solution}{\mcm@cap@solution} % 解

% 浮动环境设置
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
 \renewcommand*{\textfraction}{0.05} % 设置页面中文本区域的最小比例为 5%
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
 \renewcommand*{\topfraction}{0.9} % 页面顶部浮动体所占的最大比例为 90%
 \renewcommand*{\bottomfraction}{0.8} % 页面底部浮动体所占的最大比例为 80%
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
 \renewcommand*{\floatpagefraction}{0.85} % 单独的浮动页中，浮动体所占的最小比例为 85%
% 关于图片 graphicx
 % 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png} % 设置 \includegraphics 默认搜索的图片文件扩展名顺序
 % 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}%
  {picture/}{pic/}{pics/}{image/}{images/}} % 设置图片文件的搜索路径（文件夹）
% 图表标题
\DeclareCaptionFont{song}{\songti} % 定义一个名为 'song' 的标题字体（使用宋体）
\DeclareCaptionFont{wuhao}{\zihao{5}} % 定义一个名为 'wuhao' 的标题字体（使用5号字）
% 设置 'figure' (图片) 环境的标题样式
\captionsetup[figure]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格 (quad: 1em 宽的空格)
	font={song,wuhao,bf}, % 图的字体, 宋体、五号、加粗
	position=bottom % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置. (这是对 'caption' 宏包的误解，它确实影响位置)
}
% 设置 'table' (表格) 环境的标题样式
\captionsetup[table]{%
	format=hang,   % 标题从第二行开始都有缩进
	labelsep=quad, % 分隔符是一个空格
	font={song,wuhao,bf}, % 表的字体, 宋体、五号、加粗
	position=top % 标题位置在表格顶部
}
% 列表环境设置
\setlist{% % 使用 'enumitem' 宏包全局设置列表环境
	topsep=0.3em, % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt, % 列表项内的段落之间的垂直空白
	leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度。
}

% 超链接
	 \hypersetup{% % 配置 'hyperref' 宏包
         xetex, % 明确告知使用 xetex 驱动
		% unicode=false, % hyperref 和 xetex 同时使用时不能开启 Unicode 选项. (此行为原文件注释)
         pdfstartview=FitH, % PDF 打开时“适合页宽”显示
         CJKbookmarks=true, % 允许书签中使用 CJK 字符
         bookmarksnumbered=true, % 书签包含章节编号
         bookmarksopen=true, % 打开 PDF 时展开书签树
         colorlinks, %注释掉此项则交叉引用为彩色边框(将colorlinks和pdfborder同时注释掉) - 使用彩色文本作为链接
         pdfborder=001,   %注释掉此项则交叉引用为彩色边框 - 边框设置（与 colorlinks=true 冲突，colorlinks 优先）
		 allcolors=black, % 将所有链接（包括引用、URL、目录等）的文本颜色都设置为黑色
		 breaklinks=true}% % 允许链接文本跨行
% \if@mcm@bwprint % (此行为原文件注释)
% \AtBeginDocument{\hypersetup{hidelinks}} % (此行为原文件注释, 如果是黑白打印，则隐藏链接)
% \else\relax\fi
% 定义一个名为 'tcode' 的新 'listings' 环境
\lstnewenvironment{tcode}
  {
    \lstset{basicstyle = \small\ttfamily, % 基本样式：小号、打字机
        language=TeX, % 语言设置为 TeX
        tabsize = 4, % Tab 宽度为 4
        frame = single, % 边框为单线框
        escapechar = `, % 设置 ` (反引号) 为转义字符，可以在代码中插入 LaTeX 命令
        breaklines = true, % 自动折行
        breakatwhitespace = true, % 在空白处折行
        frameround = tttt, % 边框角为圆角
    }
  }
  {}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Document Markup
% 文档标记

% 生成封面, 使用\maketitle
% 重定义 \maketitle 命令
\renewcommand{\maketitle}{\par
	\begingroup % 开始一个分组
      \newpage % 新建一页
      \global\@topnum\z@   % Prevents figures from going at top of page. (禁止浮动体出现在此页顶部)
      \@maketitle % 调用内部的 \@maketitle 命令来实际生成内容
    \endgroup
  % 清理 \maketitle 相关命令，使其只能使用一次
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
% 定义内部的 \@maketitle 命令，这是真正生成封面的地方
\def\@maketitle{%
  \newpage % 新建一页
  \if@mcm@preface % 检查是否需要显示封面页 (如果为 true，则生成承诺书)
  % ---
  % --- 以下是用户请求注释掉的封面页（承诺书）代码 ---
  % --- 因为我们在文件顶部设置了 \@mcm@prefacefalse，所以这里的代码块将被跳过 ---
  \null % 插入一个空盒子，确保页面非空
 % 承诺书
 \vskip2ex % 垂直间距
  \thispagestyle{empty} % 强制此页页码为空
  {\zihao{4}\mcm@commit@string@headname\\[-3pt] % 排版"赛区评阅编号..."
  \noindent\rule{\textwidth-1.34em}{1pt}\par} % 绘制一条横线
  \begin{center}% % 居中环境
    {\zihao{-3}\bfseries\heiti \mcm@commit@string@titlea \par}% % 标题A (比赛名称)
    {\vskip1ex\zihao{3}\bfseries\songti \mcm@commit@string@titleb \par} % 标题B (承诺书)
  \end{center}
    {\zihao{-4} \mcm@commit@string@contents \par} % 承诺书正文
    {\vskip1ex\zihao{-4} % 填写区域
    \renewcommand{\ULthickness}{0.4pt}\setlength{\ULdepth}{2pt} % 设置下划线样式
    \hspace*{2em}\mcm@commit@string@problemnum\uline{\hspace{1em}\mcm@tokens@tihao\hfill}\makebox[0.66em]{}\par % 题号
    \mcm@commit@string@signupnum\uline{\hspace{1em}\mcm@tokens@baominghao\hfill}\makebox[0.66em]{}\par % 报名号
    \mcm@commit@string@schoolname\uline{\hfill\mcm@tokens@schoolname\hfill}\makebox[0.66em]{}\par % 学校名称
    \newlength{\mcm@lenB} % 新建一个长度变量
    \settowidth{\mcm@lenB}{\mcm@commit@string@membername\hspace{1em}1.} % 测量 "参赛队员 1." 的宽度
    \setlength{\mcm@lenB}{\textwidth-\mcm@lenB} % 计算剩余宽度
    % 不这样做右边难以对齐! (原文件注释)
    \mcm@commit@string@membername % "参赛队员"
    \begin{minipage}[t]{\mcm@lenB} % 使用 minipage 来排版队员列表
   	1.\uline{\hspace{1em}\mcm@tokens@membera\hfill} \makebox[0.46em]{}\par % 队员A
   	2.\uline{\hspace{1em}\mcm@tokens@memberb\hfill} \makebox[0.46em]{}\par % 队员B
   	3.\uline{\hspace{1em}\mcm@tokens@memberc\hfill} \makebox[0.46em]{}\par % 队员C
   \end{minipage}\par\vskip1ex
    \mcm@commit@string@supervisorname\uline{\hspace{1em}\mcm@tokens@supervisor\hfill}\makebox[0.66em]{}\par % 指导教师
    （{\kaishu 指导教师签名意味着对参赛队的行为和论文的真实性负责}） % 教师签名说明
    %{\kaishu\mcm@commit@string@inform\par} (原文件注释)
    \vskip2ex
    \newlength{\mcm@lenA} % 新建长度变量
    \settowidth{\mcm@lenA}{请仔细核对，提交后将不再允许做任何修改。如}% 测量特定字符串宽度
    \hspace*{\mcm@lenA}\mcm@commit@string@date\hspace{0.5em}\uline{\hfill\hspace{1em}\mcm@tokens@yearinput\hspace{1em}\hfill}% % 日期: 年
    \mcm@commit@string@year\uline{\hfill\mcm@tokens@monthinput\hfill}\mcm@commit@string@month% 月
    \uline{\hfill\mcm@tokens@dayinput\hfill}\mcm@commit@string@day\makebox[1em]{}\par} % 日
    \vskip1ex
    {\kaishu\bfseries\mcm@commit@string@inform\par} % 页面底部的说明文字
	\vfill % 垂直填充
	\null % 空盒子
% 编号专用页
	\else % 如果 \if@mcm@preface 为 false (即 \@mcm@prefacefalse 生效时)
	\fi % 不执行任何操作
	\makeothertitle % 调用 \makeothertitle 命令（用于生成编号页或论文标题）
	}

%% 定义 编号专用页
\def\makeothertitle{%
  \if@mcm@preface % 再次检查是否需要显示封面页 (如果为 true，则生成编号专用页)
  % ---
  % --- 以下是用户请求注释掉的封面页（编号专用页）代码 ---
  % --- 因为我们在文件顶部设置了 \@mcm@prefacefalse，所以这里的代码块将被跳过 ---
  \par
\newpage % 新建一页
\null
\thispagestyle{empty} % 此页页码为空
{\zihao{4}\mcm@numberpage@string@headname\\[-5pt] % 头部"赛区评阅编号..."
  \noindent\hspace*{0.67em}\rule{\textwidth-1.33em}{1pt}\par} % 绘制横线
\begin{center} % 居中
{\zihao{4}\bfseries\heiti \mcm@numberpage@string@titlea\par} % 标题A (比赛名称)
{\vskip1ex\zihao{3}\bfseries\songti \mcm@numberpage@string@titleb\par} % 标题B (编号专用页)
\end{center}\par
{%
\zihao{4} % 四号字
\vskip3em
\hspace*{2em}\mcm@numberpage@string@appraiselog % "赛区评阅记录..."
\par
\newlength{\mcm@lenC} % 新建长度
\setlength{\mcm@lenC}{\textwidth-8.72em} % 计算表格每列的宽度
\setlength{\mcm@lenC}{\mcm@lenC/6}
\newlength{\mcm@lenD}
\settoheight{\mcm@lenD}{\mcm@numberpage@string@reviewer} % 测量"评阅人"的高度
\setlength{\mcm@lenD}{\mcm@lenD+2em} % 增加额外高度
\newlength{\mcm@lenF}
\settoheight{\mcm@lenF}{\mcm@numberpage@string@remarks} % 测量"备注"的高度
\setlength{\mcm@lenF}{\mcm@lenF+2em} % 增加额外高度
\newcolumntype{P}{@{}p{\mcm@lenC}@{}} % 定义一个新的列类型 P
\hspace*{1.5em}\begin{tabular}{|!{\hspace{4pt}}c!{\hspace{4pt}}|*{6}{P|}} % 绘制评阅表格
 \hline
 \rule{0pt}{\mcm@lenD}\raisebox{0.6em}[0pt][0pt]{\mcm@numberpage@string@reviewer} & & & & & &  \\\cline{1-7}
 \rule{0pt}{\mcm@lenF}\raisebox{0.6em}[0pt][0pt]{\mcm@numberpage@string@remarks} & & & & & &  \\
 \hline
\end{tabular}\par
\vskip5em
\hspace*{2em}\mcm@numberpage@string@unifiednum % "送全国评阅统一编号..."
\vskip7em
\hspace*{2em}\mcm@numberpage@string@countrynum} % "全国评阅随机编号..."
\vskip7em
{\zihao{-4}\kaishu\bfseries\mcm@numberpage@string@inform\par} % 页面底部说明
\vfill % 垂直填充
\null
\newpage % 新建一页
\null
\setcounter{page}{1} % 将页码重置为 1
{\centering \zihao{3}\bfseries \@title\par} % 居中、三号、黑体、加粗，输出论文标题
\vskip1ex % 垂直间距
\begin{center}
    \vspace{0.5em}
    {\large \@author\par}
    \vspace{0.5em}
    {\large \@date\par}
\end{center}
\else % 如果 \if@mcm@preface 为 false (即 \@mcm@prefacefalse 生效时)
\setcounter{page}{1} % 将页码重置为 1
{\centering \zihao{3}\bfseries \@title\par} % 居中、三号、黑体、加粗，输出论文标题
\vskip1ex % 垂直间距
\begin{center}
    \vspace{0.5em}
    {\large \@author\par}
    \vspace{0.5em}
    {\large \@date\par}
  \end{center}
\fi
}

% 中文标题名称设置
% 重定义 \LaTeX 内部的标题名称宏，使其显示中文
\renewcommand\contentsname{\mcm@cap@contentsname} % 目录
\renewcommand\listfigurename{\mcm@cap@listfigurename} % 插图清单
\renewcommand\listtablename{\mcm@cap@listtablename} % 附表清单
\renewcommand\refname{\mcm@cap@refname} % 参考文献
\renewcommand\indexname{\mcm@cap@indexname} % 索引
\renewcommand\figurename{\mcm@cap@figurename} % 图
\renewcommand\tablename{\mcm@cap@tablename} % 表
\renewcommand\appendixname{\mcm@cap@appendixname} % P (此行原文不完整，应为 \renewcommand\appendixname{\mcm@cap@appendixname} % 附录)
\renewcommand\abstractname{\mcm@cap@abstractname} % 摘要

% 中文标题格式设置
% 目录深度
\setcounter{secnumdepth}{3} % 设置章节编号的深度到 subsubsection (x.x.x)
% 节标题格式, 居中, 使用\chinese命令修改计数器
\def\@seccntformat#1{\csname the#1\endcsname\ } % 定义章节编号的格式（编号 + 空格）
\renewcommand\thesection{\chinese{section}、} % "section" (一级标题) 编号格式：中文数字 + "、" (例如: 一、)
\renewcommand\thesubsection{\arabic{section}\thinspace.\thinspace\arabic{subsection}} % "subsection" (二级标题) 编号格式：1.1
\renewcommand\thesubsubsection{\thesubsection\thinspace.\thinspace\arabic{subsubsection}} % "subsubsection" (三级标题) 编号格式：1.1.1
% 重定义 \section 命令
\renewcommand\section{\@startsection{section}{1}{\z@}% {名称}{级别}{缩进}
 	{-3.5ex \@plus -1ex \@minus -.2ex}% {上间距}
	{2.3ex \@plus.2ex}% {下间距}
	{\centering\normalfont\zihao{3}\bfseries}} % 格式：居中、正常字体、三号、粗体
% 重定义 \subsection 命令
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\zihao{4}\bfseries}} % 格式：正常字体、四号、粗体
% 重定义 \subsubsection 命令
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\zihao{4}\bfseries}} % 格式：正常字体、四号、粗体
% 重定义 \paragraph 命令
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{3.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}
% 重定义 \subparagraph 命令
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	 {3.25ex \@plus1ex \@minus .2ex}%
	 {-1em}%
	 {\normalfont\normalsize\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define new environment and command
% 定义新环境和新命令

%% 摘要两个字设置为 4 号.
%% 定义摘要环境
\renewenvironment{abstract}{% % 重定义 'abstract' 环境
\if@twocolumn % 如果是双栏模式
		\section*{\abstractname}% % 作为不编号的章节标题
	\else % 否则（单栏模式）
	 \begin{center}% % 居中
	{\zihao{4}\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}% % 排版"摘要"二字（四号、粗体）
	 \end{center}%
 	 \quotation % 使用 quotation 环境来缩进摘要正文
	\fi}
	{\if@twocolumn\else\endquotation\newpage\null\fi} % 结束时：如果是单栏，结束 quotation 环境并换页
% 重定义 'quotation' 环境
\renewenvironment{quotation}
	{\list{}{\listparindent 2em% % 列表段落缩进 2em
	 \itemindent \listparindent % 项目缩进同段落缩进
	 \rightmargin\z@ % 右边距 0
	 \leftmargin\z@ % 左边距 0
	 \parsep \z@ \@plus\p@}% % 段落间距 0
	\item\relax} % 开始一个列表项
	{\endlist} % 结束列表

% 定义 \keywords 命令
\newcommand\keywords[1]{%
	\renewcommand{\mcm@tokens@keywords}{#1} % 将参数 #1 存入 \mcm@tokens@keywords
	\par % 另起一段
	\vskip1ex % 垂直间距
	{\noindent\zihao{-4}\heiti\mcm@cap@keywordsname：}~{\mcm@tokens@keywords} % 排版"关键字："（-4号、黑体）并后跟关键字内容
	}
% 定义附录	(此行为原文件注释)

% \renewcommand{\setthesection}{\appendixname\Alph{section}} (此行为原文件注释)
% \renewcommand\appendix{\par (此行为原文件注释)
	% \setcounter{section}{0}%
	 % \setcounter{subsection}{0}%
	% \gdef\thesection{\appendixname\@Alph\c@section}}		
% 重定义参考文献环境
\renewenvironment{thebibliography}[1]
     {\section*{\refname}% % 将参考文献作为一个不编号的章节标题
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}% % 设置页眉
      \list{\@biblabel{\@arabic\c@enumiv}}% % 定义列表标签为 [阿拉伯数字]
           {\settowidth\labelwidth{\@biblabel{#1}}% % 测量最宽的标签宽度（由参数 #1 决定）
            \leftmargin\labelwidth % 设置左边距
            \advance\leftmargin\labelsep % 左边距再增加标签分隔符的宽度
            \@openbib@code
            \usecounter{enumiv}% % 使用 enumiv 计数器
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}% % 编号格式为阿拉伯数字
      \sloppy % 允许更宽松的单词间距，以改善断行
      \clubpenalty4000 % 增加“孤行”惩罚值
      \@clubpenalty \clubpenalty
      \widowpenalty4000% % 增加“寡行”惩罚值
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}% % 定义空环境的警告
      \endlist}	% 结束列表

% 定义一系列命令，用于捕获封面页上的信息
\newcommand*\tihao[1]{%
	\renewcommand{\mcm@tokens@tihao}{#1}} % 题号
\newcommand*\baominghao[1]{%
	\renewcommand{\mcm@tokens@baominghao}{#1}} % 报名号
\newcommand*\schoolname[1]{%
	\renewcommand{\mcm@tokens@schoolname}{#1}} % 学校名称
\newcommand*\membera[1]{%
	\renewcommand{\mcm@tokens@membera}{#1}} % 队员A
\newcommand*\memberb[1]{%
	\renewcommand{\mcm@tokens@memberb}{#1}} % 队员B
\newcommand*\memberc[1]{%
	\renewcommand{\mcm@tokens@memberc}{#1}} % 队员C
\newcommand*\supervisor[1]{%
	\renewcommand{\mcm@tokens@supervisor}{#1}} % 指导教师
\newcommand*\yearinput[1]{%
	\renewcommand{\mcm@tokens@yearinput}{#1}} % 年
\newcommand*\monthinput[1]{%
	\renewcommand{\mcm@tokens@monthinput}{#1}} % 月
\newcommand*\dayinput[1]{%
	\renewcommand{\mcm@tokens@dayinput}{#1}} % 日

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialization
% 初始化 (定义所有中文字符串常量)
 %%%数学定理相关的常量
\newcommand*{\mcm@cap@definition}{定义}
\newcommand*{\mcm@cap@theorem}{定理}
\newcommand*{\mcm@cap@lemma}{引理}
\newcommand*{\mcm@cap@corollary}{推论}
\newcommand*{\mcm@cap@assumption}{假设}
\newcommand*{\mcm@cap@conjecture}{猜想}
\newcommand*{\mcm@cap@axiom}{公理}
\newcommand*{\mcm@cap@principle}{定律}
\newcommand*{\mcm@cap@problem}{问题}
\newcommand*{\mcm@cap@example}{例}
\newcommand*{\mcm@cap@proof}{证明}
\newcommand*{\mcm@cap@solution}{解}
 %%%  中文标题名称
\newcommand*{\mcm@cap@contentsname}{目录}
\newcommand*{\mcm@cap@listfigurename}{插图清单}
\newcommand*{\mcm@cap@listtablename}{附表清单}
\newcommand*{\mcm@cap@refname}{参考文献}
\newcommand*{\mcm@cap@indexname}{索引}
\newcommand*{\mcm@cap@figurename}{图}
\newcommand*{\mcm@cap@tablename}{表}
\newcommand*{\mcm@cap@appendixname}{附录}
\newcommand*{\mcm@cap@abstractname}{摘要}
 %%%  中文关键字
\newcommand*{\mcm@cap@keywordsname}{关键字}

 %%% 承诺书中的常量
\newcommand*\mcm@commit@string@headname{赛区评阅编号（由赛区组委会填写）：}
\newcommand*\mcm@commit@string@titlea{\the\year 高教社杯全国大学生数学建模竞赛} % \the\year 会自动获取当前年份
\newcommand*\mcm@commit@string@titleb{承\hspace{1em}诺\hspace{1em}书}
\newcommand\mcm@commit@string@contents{\quotation % 承诺书正文
 我们仔细阅读了《全国大学生数学建模竞赛章程》和《全国大学生数学建模竞赛参赛规则》%
\hspace*{-0.6em}（以下简称为“竞赛章程和参赛规则”，\hspace{-0.2em}可从全国大学生数学建模竞赛网站下载）。

我们完全明白，在竞赛开始后参赛队员不能以任何方式（包括电话、电子邮件、网上QQ群、微信群等）与队外的任
何人（包括指导教师）研究、讨论与赛题有关的问题。

我们知道，抄袭别人的成果是违反竞赛章程和参赛规则的，如果引用别人的成果或资料（包括网上资料），
必须按照规定的参考文献的表述方式列出，并在正文引用处予以标注。在网上交
流和下载他人的论文是严重违规违纪行为。

{\bfseries\song 我们以中国大学生名誉和诚信郑重承诺，严格遵守竞赛章程和参赛规则，以保证竞赛的公正、公平性。
如有违反竞赛章程和参赛规则的行为，我们将受到严肃处理。}

 我们授权全国大学生数学建模竞赛组委会，可将我们的论文以任何形式进行公开展示%
（包括进行网上公示，在书籍、期刊和其他媒体进行正式或非正式发表等）。
\endquotation
}
\newcommand*\mcm@commit@string@problemnum{我们参赛选择的题号（从A/B/C/D中选择一项填写）：}
\newcommand*\mcm@commit@string@signupnum{我们的报名参赛队号（12位数字全国统一编号）：}
\newcommand*\mcm@commit@string@schoolname{参赛学校（完整的学校全称，不含院系名）：}
\newcommand*\mcm@commit@string@membername{参赛队员 (打印并签名) ：}
\newcommand*\mcm@commit@string@supervisorname{指导教师或指导教师组负责人  (打印并签名)：}
\newcommand\mcm@commit@string@inform{\quotation % 承诺书底部的说明
\noindent{（\bfseries\kai 请勿改动此页内容和格式。此承诺书打印签名后作为纸质论文的封面，注意电子版论文中不得出现此页。%
以上内容请仔细核对，如填写错误，论文可能被取消评奖资格。）}
\endquotation
}
\newcommand*\mcm@commit@string@date{日期:}
\newcommand*\mcm@commit@string@year{年}
\newcommand*\mcm@commit@string@month{月}
\newcommand*\mcm@commit@string@day{日}
\newcommand*\mcm@commit@string@appraisenum{赛区评阅编号（由赛区组委会评阅前进行编号）：}

 %%% 编号专用页中的常量
\newcommand*\mcm@numberpage@string@headname{赛区评阅编号（由赛区组委会填写）：}
\newcommand*\mcm@numberpage@string@titlea{\the\year 高教社杯全国大学生数学建模竞赛}
\newcommand*\mcm@numberpage@string@titleb{编\hspace{.5em}号\hspace{.5em}专\hspace{.5em}用\hspace{.5em}页}
\newcommand*\mcm@numberpage@string@appraiselog{赛区评阅记录（可供赛区评阅时使用）：}
% \shortstack 用于创建垂直堆叠的文本，这里用来排版竖向的 "评阅人" 和 "备注"
\newcommand\mcm@numberpage@string@reviewer{\shortstack{评\\ 阅\\ 人}}
\newcommand\mcm@numberpage@string@remarks{\shortstack{备\\ 注}}
\newcommand*\mcm@numberpage@string@unifiednum{送全国评阅统一编号（由赛区组委会填写）：}
\newcommand*\mcm@numberpage@string@countrynum{全国评阅随机编号（由全国组委会填写）：}
\newcommand\mcm@numberpage@string@inform{\quotation % 编号页底部的说明
\noindent（{\bfseries\kai 请勿改动此页内容和格式。此编号专用页仅供赛区和全国评阅使用，参赛队打印后装订到纸质论文的第二页上。
注意电子版论文中不得出现此页。}）
\endquotation
}
%设置目录格式 (此行为原文件注释)
% 节的目录格式 (此行为原文件注释)
% \titlecontents{section}[0pt]{\vspace{2mm}\bfseries} (此行为原文件注释)
% {\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage} (此行为原文件注释)
% % 小节的目录格式 (此行为原文件注释)
% \titlecontents{subsection}[30pt]{\songti} (此行为原文件注释)
% {\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage} (此行为原文件注释)
% \titlecontents{subsubsection}[55pt]{\songti} (此行为原文件注释)
% {\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage} (此行为原文件注释)

\endinput % 标记类文件的结束