
pdf: 
	pandoc -s -S --template=simple.latex --biblio CommentReply.bib --csl proceedings-of-the-royal-society-b.csl CommentReply.md -o CommentReply.tex
	pdflatex CommentReply.tex	
	pdflatex CommentReply.tex

bib: 


arxiv: 
	pandoc -s -S --template=elsarticle.latex --biblio CommentReply.bib --csl proceedings-of-the-royal-society-b.csl CommentReply.md -o arxiv.tex
	pdflatex arxiv.tex	
	pdflatex arxiv.tex



clean:
	rm *.log *.aux *.spl *.out
