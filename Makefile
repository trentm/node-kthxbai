#
# Copyright (c) 2014, Trent Mick. All rights reserved.
# Copyright (c) 2014, Joyent, Inc. All rights reserved.
#

NODEUNIT = ./node_modules/.bin/nodeunit
JSSTYLE_FILES := bin/kthxbai
NODEOPT ?= $(HOME)/opt


all $(NODEUNIT):
	npm install

.PHONY: distclean
distclean:
	rm -rf node_modules

.PHONY: check-jsstyle
check-jsstyle: $(JSSTYLE_FILES)
	./tools/jsstyle -o indent=4,doxygen,unparenthesized-return=0,blank-after-start-comment=0,leading-right-paren-ok $(JSSTYLE_FILES)

.PHONY: check
check: check-jsstyle
	@echo "Check ok."


.PHONY: versioncheck
versioncheck:
	[[ `cat package.json | json version` == `grep '^## ' CHANGES.md | head -1 | awk '{print $$2}'` ]]

.PHONY: cutarelease
cutarelease: versioncheck
	[[ `git status | tail -n1` == "nothing to commit, working directory clean" ]]
	./tools/cutarelease.py -p kthxbai -f package.json

