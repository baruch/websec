PREFIX=/usr/local
BINDIR=$(DESTDIR)$(PREFIX)/bin
MANDIR=$(DESTDIR)$(PREFIX)/share/man
MAN1DIR=$(MANDIR)/man1
MAN5DIR=$(MANDIR)/man5
DOCDIR=$(DESTDIR)$(PREFIX)/share/doc/websec
EMACSDIR=$(DESTDIR)$(PREFIX)/share/emacs/site-lisp
VIMSYNDIR=$(DESTDIR)$(PREFIX)/share/vim/vim61/syntax

PROGSRC=websec webdiff
CONFSRC=url.list ignore.list

PROGMAN=$(PROGSRC:%=%.1)
CONFMAN=$(CONFSRC:%=%.5)

PROGMANHTML=$(addsuffix (1).html,$(PROGSRC))
CONFMANHTML=$(addsuffix (5).html,$(CONFSRC))

# Generated files
GENFILES=$(PROGMAN) $(CONFMAN)
HTMLFILES=$(addprefix ",$(addsuffix ",$(PROGMANHTML) $(CONFMANHTML)))

all: $(GENFILES)

install: all
	install -d $(BINDIR)
	install websec $(BINDIR)/
	install webdiff $(BINDIR)/

	install -d $(MAN1DIR)
	install websec.1 $(MAN1DIR)
	install webdiff.1 $(MAN1DIR)

	install -d $(MAN5DIR)
	install url.list.5 $(MAN5DIR)
	install ignore.list.5 $(MAN5DIR)

	install -d $(DOCDIR)
	install -d $(DOCDIR)/examples
	install -m 0644 url.list $(DOCDIR)/examples/
	install -m 0644 ignore.list $(DOCDIR)/examples/
	install -m 0644 README $(DOCDIR)/

	install -d $(EMACSDIR)
	install -m 0644 websec.el $(EMACSDIR)
	
	install -d $(VIMSYNDIR)
	install -m 0644 websec.vim $(VIMSYNDIR)

clean:
	rm -f $(GENFILES) pod2htm* $(HTMLFILES)

$(PROGMAN) : %.1 : %
	pod2man $< > $@

$(CONFMAN) : %.5 : %
	pod2man --section 5 $< > $@

install_html: html
	install -m 0644 $(HTMLFILES) $(DEST)

html: $(CONFMANHTML) $(PROGMANHTML)

$(CONFMANHTML) : %(5).html : %
	pod2html --htmlroot . --podroot . --podpath . --infile "$<" --outfile "$@"

$(PROGMANHTML) : %(1).html : %
	-rm -f pod2htm*
	pod2html --htmlroot . --podroot . --podpath . --infile "$<" --outfile "$@"
