
PROJECT=main

PDFVIEWER=evince
DVIVIEWER=xdvi
PNGVIEWER=eog

.PHONY: all clean png

.DEFAULT_GOAL := $(PROJECT).dvi

$(PROJECT).dvi: $(PROJECT).tex
	+@echo "Generating $@ . . ."
	@latex $<
	@$(DVIVIEWER) $@ &

clean:
	rm -f *.log *.aux *.dvi *.pdf *.out

$(PROJECT).png: $(PROJECT).dvi
	+@echo "Generating $@ . . ."
	@dvipng $< -o $@
	@$(PNGVIEWER) $@ &

$(PROJECT).pdf: $(PROJECT).tex
	+@echo "Generating $@ . . ."
	@pdflatex $<
	@$(PDFVIEWER) $@ &

all: $(PROJECT).pdf

png: $(PROJECT).png

