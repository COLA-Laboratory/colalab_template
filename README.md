# COLALab Technical Report Template (LaTeX)

This repository provides a COLALab technical report template with a clean, section-based structure and reusable examples (figures, tables, equations, definitions, and algorithms). The focus is readability and a practical writing workflow, not strict journal-specific typesetting.



## Where To Edit Authors / Affiliations

Title and author metadata is centralized in `sections/title.tex`. This is the only file you need to edit for:
- report title and subtitle
- multiple authors
- per-author affiliation mapping
- equal contribution (co-first authors) and corresponding author marks

Key commands:
- `\ReportTitle{...}`
- `\ReportSubtitle{...}`
- `\ReportAffil{<id>}{<Department, Institution, City, Country>}`
- `\ReportAuthor{Name}{affil-ids}[roles]{email}`

Roles:
- `equal` prints `†` and enables an equal-contribution note
- `corresponding` prints `*` and (optionally) adds the author email to the correspondence note

Implementation details live in `reporttitleblock.sty`. Most users should not need to edit it.

## Abstract / Keywords / Project Repo

Edit `sections/abstract.tex`:
- The `Abstract` heading is centered and styled in blue.
- `Keywords:` and `Project Repo:` labels are blue.
- Replace the placeholder repo URL (`[REPO_URL]`) with your project link.

## Directory Layout

- `main.tex`
  - root file: packages, global macros/styles, and section includes
- `sections/title.tex`
  - editable title/author/affiliation metadata (for the title block)
- `reporttitleblock.sty`
  - title block rendering logic (macros + formatting)
- `sections/`
  - `abstract.tex`, `introduction.tex`, `background.tex`, `methods.tex`, `experiments.tex`, `results.tex`, `discussion.tex`, `conclusion.tex`, `appendix.tex`
- `figs/`
  - figures (e.g., `figs/colalab.png`)
- `references/references.bib`
  - bibliography database (add your BibTeX entries here)
- `references/IEEEtran.bst`
  - BibTeX style file (IEEEtran)
- `build/`
  - LaTeX build artifacts (generated)

## Cross-References (Recommended Convention)

This template uses `prettyref` and defines `\pref` in `main.tex`.

Use consistent label prefixes so `\pref{...}` prints the right prefix automatically:
- sections: `sec:...`
- figures: `fig:...`
- tables: `tab:...`
- equations: `eq:...`
- appendix: `app:...`
- algorithms: `alg:...`

Example:

```tex
See \pref{sec:methods} and \pref{fig:system_overview}.
```

## How To Extend the Template

- Add a new section:
  - create `sections/your_section.tex`
  - include it from `main.tex` with `\input{sections/your_section}`
- Add figures:
  - put image files in `figs/`
  - use `\includegraphics` in your section
- Add tables:
  - see examples under `sections/experiments.tex` and `sections/results.tex`
- Add references:
  - add BibTeX entries to `references/references.bib`
  - cite in text with `\cite{key}`

## Notes

- Headings and hyperlinks are styled with a deep "Nature-like" blue (`natureblue`) in `main.tex`.
- Captions use a bold label (`Figure X`, `Table X`) via `\captionsetup` in `main.tex`.
