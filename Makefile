PDF_LATEX=pdflatex -halt-on-error
TEX_FILE=$(wildcard *.tex)
OUTPUT_PDF=$(patsubst %.tex, %.pdf, $(TEX_FILE))

# Figure out the right RM for win/unix
ifdef ComSpec
	RM=del /F /Q
else
	RM=rm -f
endif

all: $(OUTPUT_PDF)

%.pdf: %.tex
	$(PDF_LATEX) $<
	$(PDF_LATEX) $<
	$(PDF_LATEX) $<

.PHONY: clean
clean:
	$(RM) *.aux; $(RM) *.dvi; $(RM) *.log; $(RM) *.pdf; $(RM) *.gz; \
		$(RM) *.bbl; $(RM) *.blg; $(RM) *.out; $(RM) *.lbl; $(RM) *.brf

