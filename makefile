FILE=main
OUTDIR=build

.PHONY: all pdf clean cleanall

all: pdf

# Prefer pdflatex for modern workflows (PDF figures, hyperlinks, etc.).
$(OUTDIR):
	mkdir -p $(OUTDIR)

pdf: $(OUTDIR)
	pdflatex -interaction=nonstopmode -halt-on-error -output-directory=$(OUTDIR) $(FILE).tex
	bibtex $(OUTDIR)/$(FILE) || true
	pdflatex -interaction=nonstopmode -halt-on-error -output-directory=$(OUTDIR) $(FILE).tex
	pdflatex -interaction=nonstopmode -halt-on-error -output-directory=$(OUTDIR) $(FILE).tex
	cp $(OUTDIR)/$(FILE).pdf $(FILE).pdf


clean:
	rm -f \
		$(FILE).out $(FILE).aux $(FILE).log $(FILE).bbl $(FILE).blg \
		$(FILE).toc $(FILE).lof $(FILE).lot \
		$(FILE).fls $(FILE).fdb_latexmk $(FILE).synctex.gz \
		$(FILE).dvi $(FILE).ps \
		$(OUTDIR)/$(FILE).out $(OUTDIR)/$(FILE).aux $(OUTDIR)/$(FILE).log $(OUTDIR)/$(FILE).bbl $(OUTDIR)/$(FILE).blg \
		$(OUTDIR)/$(FILE).toc $(OUTDIR)/$(FILE).lof $(OUTDIR)/$(FILE).lot \
		$(OUTDIR)/$(FILE).fls $(OUTDIR)/$(FILE).fdb_latexmk $(OUTDIR)/$(FILE).synctex.gz \
		$(OUTDIR)/$(FILE).dvi $(OUTDIR)/$(FILE).ps
	# Some tools (e.g., latexmk/IDEs) may create empty subfolders under build/.
	rmdir $(OUTDIR)/sections 2>/dev/null || true

cleanall: clean
	rm -f $(FILE).pdf $(OUTDIR)/$(FILE).pdf
	rmdir $(OUTDIR) 2>/dev/null || true
