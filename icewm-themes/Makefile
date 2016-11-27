DESTDIR=

PREFIX=$(DESTDIR)/usr/X11R6/

LIBDIR=$(PREFIX)/lib/X11/icewm/themes

all:

# Makefile TABS *SUCK*
install: all
	@mkdir -p $(LIBDIR)
	@for theme in * ; do \
            if [ -d $$theme -a $$theme != "debian" ] ; then \
                echo Installing theme: $$theme; \
		rm -rf $(LIBDIR)/$$theme; \
                cp -a $$theme $(LIBDIR)/$$theme; \
            fi \
        done

