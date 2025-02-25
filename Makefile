SOURCE=$(wildcard *.tex)
TARGET=$(SOURCE:.tex=.pdf)

all: $(TARGET)

$(TARGET): $(SOURCE) *.bib
	pdflatex $(SOURCE)
	bibtex $(basename $(SOURCE))
	pdflatex $(SOURCE)
	pdflatex $(SOURCE)
#	(okular $(TARGET) >/dev/null 2>&1 &)

clean:
	rm -f $(TARGET) *.log *.aux TEX/*.aux TeX/*.aux \
*.idx *.toc *.glo *.lof *.lot *.xdy *.out *.bbl *.blg \
*.4ct *.4tc *.dvi *.xref *.tmp *.html *.css *.idv *.lg \
*.acn *.ist *.pyg *.cut

.PHONY: clean
