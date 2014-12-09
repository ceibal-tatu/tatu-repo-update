all:

install: all
	# Do not use unattended upgrades, use cron instead.
	#install -d $(DESTDIR)/etc/apt/apt.conf.d/
	#install -o root -g root -m 644 90ceibal-updates $(DESTDIR)/etc/apt/apt.conf.d/
	install -d $(DESTDIR)/var/spool/ceibal-update-check/
	install -d $(DESTDIR)/var/run/
	install -d $(DESTDIR)/usr/sbin/
	install -o root -g root -m 755 ceibal-update $(DESTDIR)/usr/sbin/
	install -o root -g root -m 755 ceibal-update-check $(DESTDIR)/usr/sbin/
	install -d $(DESTDIR)/etc/apt/preferences.d/
	install -o root -g root -m 644 90ceibal.pref $(DESTDIR)/etc/apt/preferences.d/
	install -d $(DESTDIR)/etc/apt/sources.list.d/
	install -o root -g root -m 644 tatu.list $(DESTDIR)/etc/apt/sources.list.d/
	install -o root -g root -m 755 -d $(DESTDIR)/etc/ceibal-update.d/
