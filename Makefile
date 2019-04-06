DESTDIR = /
NAME    = agent
PROFILE = $$HOME/.profile
VERSION = 1

install:
	@mkdir -p $$(dirname $(DESTDIR)/$(PROFILE))
	grep -qFx '$(NAME)() { # v. $(VERSION)' $(DESTDIR)/$(PROFILE) 2>/dev/null \
	  || sed 's/^agent(.*/$(NAME)() { # v. $(VERSION)/' <agent-solo.sh >>$(DESTDIR)/$(PROFILE)
