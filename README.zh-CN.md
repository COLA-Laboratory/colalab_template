# Technical Report Template (LaTeX)

这个仓库是一个 COLALab 的「technical report」模板，目标是提供一个清晰的文档结构与一套可复用的示例（表格、公式、定义、算法、图），而不是追求某个特定会议/期刊的严格排版风格。



## 在哪里定义作者与单位

标题与作者信息集中在 `sections/title.tex`，一般只需要改这个文件就能完成：
- 标题、子标题
- 多作者列表
- 作者与单位编号映射
- 共同一作（`†`）和通讯作者（`*`）标记及说明

相关命令：
- `\\ReportTitle{...}`
- `\\ReportSubtitle{...}`
- `\\ReportAffil{<id>}{<Department, Institution, City, Country>}`
- `\\ReportAuthor{Name}{affil-ids}[roles]{email}`

实现与排版逻辑在 `reporttitleblock.sty`（通常不需要修改）。

## 目录结构

- `main.tex`
  - 根文件（preamble、宏、全局 package、章节组织、参考文献等）
- `sections/title.tex`
  - 标题与作者/单位信息（title block 配置）
- `reporttitleblock.sty`
  - title block 的宏与渲染逻辑
- `sections/`
  - 各章节文件：`abstract.tex`、`introduction.tex`、`background.tex`、`methods.tex`、`experiments.tex`、`results.tex`、`discussion.tex`、`conclusion.tex`、`appendix.tex`
- `figs/`
  - 图片资源（例如 `figs/colalab.png`）
- `references/references.bib`
  - 参考文献库（BibTeX）
- `references/IEEEtran.bst`
  - BibTeX 样式文件（IEEEtran）
- `build/`
  - 编译产物与中间文件（自动生成）

## 交叉引用约定（建议）

模板使用 `prettyref`，并在 `main.tex` 定义了 `\\pref`（等价于 `\\prettyref`）。

建议统一 label 前缀，这样 `\\pref{...}` 才能自动输出 “Section/Fig./Table/Appendix/Algorithm ...”：

- 章节：`sec:...`，例如 `\\label{sec:introduction}`
- 图：`fig:...`
- 表：`tab:...`
- 公式：`eq:...`
- 附录：`app:...`
- 算法：`alg:...`

示例：

```tex
See \\pref{sec:methods} and \\pref{fig:system_overview}.
```

## 如何拓展模板

- 新增章节：在 `sections/` 下新增一个 `.tex`，然后在 `main.tex` 中 `\\input{sections/xxx}` 引入
- 图片资源：把文件放到 `figs/`，用 `\\includegraphics` 引用；或者像模板一样用 `tikz/pgfplots` 直接画图
- 参考文献：在 `references/references.bib` 添加条目，并在正文中 `\\cite{key}`

