PREFIX=/usr/local
BINDIR=$(DESTDIR)$(PREFIX)/bin
MANDIR=$(DESTDIR)$(PREFIX)/share/man
DOCDIR=$(DESTDIR)$(PREFIX)/share/doc/websec

all: websec.1 webdiff.1

install:
	install -d $(BINDIR)
	install websec $(BINDIR)/
	install webdiff $(BINDIR)/

	install -d $(MANDIR)/man1/
	install websec.1 $(MANDIR)/man1/
	install webdiff.1 $(MANDIR)/man1/

	install -d $(DOCDIR)
	install -d $(DOCDIR)/examples
	install -m 0644 url.list $(DOCDIR)/examples/
	install -m 0644 ignore.list $(DOCDIR)/examples/
	install -m 0644 README $(DOCDIR)/

clean:
	rm -f websec.1 webdiff.1

websec.1 webdiff.1 : %.1 : %
	pod2man $< > $@
