bib:
	bibtool -d -s --preserve.key.case=on -x fallacy.aux ~/Documents/Mendeley/bib/*.bib -o fallacy.bib


clean:
		rm -rf *.log *.bbl *.blg *.out *.spl
