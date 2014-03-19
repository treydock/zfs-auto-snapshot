prefix := /usr
sysconfdir := /etc
sbindir := $(prefix)/sbin
datadir := $(prefix)/share
mandir := $(datadir)/man

_default:
	@echo "No default. Try 'make install'"

install:
	install -d $(DESTDIR)$(sysconfdir)/default
	install etc/zfs-auto-snapshot.conf $(DESTDIR)$(sysconfdir)/default/zfs-auto-snapshot
	install -d $(DESTDIR)$(sysconfdir)/cron.d
	install -d $(DESTDIR)$(sysconfdir)/cron.daily
	install -d $(DESTDIR)$(sysconfdir)/cron.hourly
	install -d $(DESTDIR)$(sysconfdir)/cron.weekly
	install -d $(DESTDIR)$(sysconfdir)/cron.monthly
	install -m 0644 etc/zfs-auto-snapshot.cron.frequent $(DESTDIR)$(sysconfdir)/cron.d/zfs-auto-snapshot
	install etc/zfs-auto-snapshot.cron.hourly $(DESTDIR)$(sysconfdir)/cron.hourly/zfs-auto-snapshot
	install etc/zfs-auto-snapshot.cron.daily $(DESTDIR)$(sysconfdir)/cron.daily/zfs-auto-snapshot
	install etc/zfs-auto-snapshot.cron.weekly $(DESTDIR)$(sysconfdir)/cron.weekly/zfs-auto-snapshot
	install etc/zfs-auto-snapshot.cron.monthly $(DESTDIR)$(sysconfdir)/cron.monthly/zfs-auto-snapshot
	install -d $(DESTDIR)$(mandir)/man8
	install src/zfs-auto-snapshot.8 $(DESTDIR)$(mandir)/man8/zfs-auto-snapshot.8
	install -d $(DESTDIR)$(sbindir)
	install src/zfs-auto-snapshot.sh $(DESTDIR)$(sbindir)/zfs-auto-snapshot
