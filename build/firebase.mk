FIREBASE_PROJECT := $(PROJECT_ORG)-$(PROJECT_ENV)-prj-$(PROJECT_SERVICE)

.PHONY: deploy

help-body::
	@$(call HELP_HEADING,-,Firebase Targets)
	@$(HELP) "* deploy" "deploy code and assets to your Firebase project"
	@echo

deploy : build firebase-config
ifeq ($(PROJECT_GIT_BRANCH),main)
	firebase deploy --project=production --only hosting
else
	firebase deploy --project=default --only hosting
endif

