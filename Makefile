install:
	install websec $(DESTDIR)/usr/bin/websec
	install webdiff $(DESTDIR)/usr/bin/webdiff

	install websec.1 $(DESTDIR)/usr/share/man/man1/
	install webdiff.1 $(DESTDIR)/usr/share/man/man1/

	install -m 0644 url.list $(DESTDIR)/usr/share/doc/websec/examples
	install -m 0644 ignore.list $(DESTDIR)/usr/share/doc/websec/examples
clean:
	@echo '- clean: nothing to do -'
