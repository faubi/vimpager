PREFIX?= /usr/local
INSTALL?= install
INSTALLDIR= ${INSTALL} -d
INSTALLBIN= ${INSTALL} -m 555
INSTALLMAN= ${INSTALL} -m 444

uninstall:
	rm -f ${PREFIX}/bin/vimpager

install: 
	${INSTALLDIR} ${DESTDIR}${PREFIX}/bin
	${INSTALLBIN} vimpager ${DESTDIR}${PREFIX}/bin/
	${INSTALLDIR} ${DESTDIR}${PREFIX}/man/man1
	${INSTALLMAN} vimpager.1 ${DESTDIR}${PREFIX}/man/man1

man: vimpager.1

vimpager.1:
	pandoc -s -w man vimpager.md -o vimpager.1

README:
	pandoc -s -w plain vimpager.md -o README

.PHONY: install uninstall man