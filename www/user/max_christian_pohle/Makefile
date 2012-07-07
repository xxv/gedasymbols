all:
	+make -B symbols
	+make -B footprints

symbols:
	tree --noreport -T "symbols" --prune -P "*.sym|*.fp" -I CVS -X symbols > symbols.xml
	xsltproc gedasymbols-li.xslt symbols.xml > symbols.html

footprints:
	tree --noreport -T "footprints" --prune -P "*.sym|*.fp" -I CVS -X footprints > footprints.xml
	xsltproc gedasymbols-li.xslt footprints.xml > footprints.html


clean:
	rm -f symbols.html symbols.xml
	rm -f footprints.html footprints.xml

.PHONY:
	
