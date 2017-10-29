.PHONY: pdf png clean
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

clean:
	rm -f *.log *.aux *.dvi *.pdf *.out

