.PHONY: install outdated update serve build lint prettier assets clean

SVG_FILES := $(wildcard $(DIR_SOURCE)/assets/*.svg)

help-body::
	@$(call HELP_HEADING,-,NPM targets)
	@$(HELP) "* install" "install packages"
	@$(HELP) "* outdated" "check for outdated packages"
	@$(HELP) "* update" "update packages"
	@$(HELP) "* serve" "start development server"
	@$(HELP) "* build" "build for production"
	@$(HELP) "* lint" "lint and fix source files"
	@$(HELP) "* clean" "remove object files and cached files"
	@echo

install outdated update:
	npm $@

firebase-config:
	cp $(DIR_CONFIGS)/firebase.$(PROJECT_ENV).json $(DIR_ROOT)
	mv $(DIR_ROOT)/firebase.$(PROJECT_ENV).json $(DIR_ROOT)/firebase.json

serve:
	npm run $@

build:
ifeq ($(PROJECT_GIT_BRANCH),main)
	npm run build-prod
else
	npm run build-dev
endif


lint: firebase-config
	npm run $@

prettier:
	prettier -w  --bracket-same-line ./src/


assets:
	for f in forme haii logo; do \
		$(DIR_SCRIPTS)/assets.sh generate $(DIR_SOURCE)/assets/$$f.svg; \
		cp $(DIR_PUBLIC)/img/icons/apple-touch-icon.png $(DIR_SOURCE)/assets/$$f.png; \
	done

clean:
	rm -rf $(DIR_OUT)
