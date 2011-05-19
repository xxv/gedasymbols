all: ibis.lib

%.lib: %.ibs ibis.py
	./ibis.py $< $@

IBIS_COMPONENTS=\
	ibis_input.sch \
	ibis_output.sch \
	ibis_open_source.sch \
	ibis_open_sink.sch \
	ibis_buffer.sch \
	ibis_terminator.sch \
	ibis_dynamic_clamp.sch

ibis.lib: $(IBIS_COMPONENTS)
	@-rm -f $@
	@echo Generating $@...
	@set -e; for n in $^; do \
		echo Adding $$n; \
		echo ".lib $${n%%.sch}" >> $@; \
		gnetlist -g spice-sdb -o /dev/stderr $$n 2>&1 >/dev/null | grep -v '^.end$$' >> $@; \
		echo ".endl" >> $@; \
	done
	@echo Done

clean:
	-rm *.lib
