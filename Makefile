.PHONY: pdf png clean all
.DEFAULT_GOAL := pdf

PROJECT=main

# Platform-specific programs
PDFVIEWER=evince
DVIVIEWER=xdvi
PNGVIEWER=eog

$(PROJECT).dvi: $(PROJECT).tex
	+@echo "Generating $@ . . ."
	@latex $<
	@$(DVIVIEWER) $@ &

$(PROJECT).png: $(PROJECT).dvi
	+@echo "Generating $@ . . ."
	@dvipng $< -o $@
	@$(PNGVIEWER) $@ &

$(PROJECT).pdf: $(PROJECT).tex
	+@echo "Generating $@ . . ."
	@pdflatex $<
	@$(PDFVIEWER) $@ &

pdf: $(PROJECT).pdf
png: $(PROJECT).png
all: pdf png

clean:
	rm -f *.log *.aux *.dvi $(PROJECT).pdf $(PROJECT).png *.out

