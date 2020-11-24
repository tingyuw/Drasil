srs: Truss_SRS.pdf

Truss_SRS.pdf: Truss_SRS.tex
	lualatex $(TEXFLAGS) Truss_SRS
	-bibtex $(BIBTEXFLAGS) Truss_SRS
	lualatex $(TEXFLAGS) Truss_SRS
	lualatex $(TEXFLAGS) Truss_SRS

.PHONY: srs
