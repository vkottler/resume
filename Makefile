.PHONY: pdf png clean all
.DEFAULT_GOAL := pdf

PROJECT=main

# Platform-specific programs
PDFVIEWER=evince
DVIVIEWER=xdvi
PNGVIEWER=eog

subsections += sections/education.tex
subsections += sections/name.tex
subsections += sections/work.tex
subsections += sections/skills_ce.tex
subsections += sections/skills_cs.tex
subsections += sections/leadership.tex
subsections += sections/involvement.tex
subsections += sections/awards.tex

$(PROJECT).dvi: $(PROJECT).tex $(subsections)
	+@echo "Generating $@ . . ."
	@latex $<
	@$(DVIVIEWER) $@ &

$(PROJECT).png: $(PROJECT).dvi $(subsections)
	+@echo "Generating $@ . . ."
	@dvipng $< -o $@
	@$(PNGVIEWER) $@ &

$(PROJECT).pdf: $(PROJECT).tex $(subsections)
	+@echo "Generating $@ . . ."
	@pdflatex $<
	@$(PDFVIEWER) $@ &

pdf: $(PROJECT).pdf
png: $(PROJECT).png
all: pdf png

clean:
	rm -f *.log *.aux *.dvi $(PROJECT).pdf $(PROJECT).png *.out

