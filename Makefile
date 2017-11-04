.PHONY: pdf png clean all dvi
.DEFAULT_GOAL := pdf

PROJECT=main

# Platform-specific programs
PDFVIEWER := evince
DVIVIEWER := xdvi
PNGVIEWER := eog
RM_CMD := rm -f
NO_CAP_SHELL := &

# This is set when invoked from Windows
ifeq ($(OS),Windows_NT)
	PROG_32 := C:\Program Files (x86)
	PDF_EXEC := AcroRd32.exe
	PDFVIEWER := start "$(PROG_32)\Adobe\Acrobat Reader DC\Reader\$(PDF_EXEC)"
	RM_CMD := del /F
	PNGVIEWER :=
	NO_CAP_SHELL :=
	DVIVIEWER :=
endif

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

dvi: $(PROJECT).dvi
	@$(DVIVIEWER) $@ $(NO_CAP_SHELL)

$(PROJECT).png: $(PROJECT).dvi $(subsections)
	+@echo "Generating $@ . . ."
	@dvipng $< -o $@

png: $(PROJECT).png
	@$(PNGVIEWER) $@ $(NO_CAP_SHELL)

$(PROJECT).pdf: $(PROJECT).tex $(subsections)
	+@echo "Generating $@ . . ."
	@pdflatex $<
	@$(PDFVIEWER) $@ $(NO_CAP_SHELL)

pdf: $(PROJECT).pdf

all: pdf png
clean:
	@$(RM_CMD) *.log *.aux *.dvi $(PROJECT).pdf $(PROJECT).png *.out
