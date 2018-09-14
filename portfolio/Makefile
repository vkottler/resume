.PHONY: clean
.SECONDARY:
.DEFAULT_GOAL := portfolio

# platform-specific programs
PDFVIEWER := evince
DVIVIEWER := xdvi
PNGVIEWER := eog

%.dvi: %.tex
	latex $<

%.png: %.dvi
	dvipng $< -o $@

%.pdf: %.tex
	pdflatex $<

%: %.pdf
	@$(PDFVIEWER) $< &

clean:
	@rm -f *.log *.aux *.dvi *.out *.pdf *.nav *.snm *.toc
