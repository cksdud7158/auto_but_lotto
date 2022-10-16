OPENAPI_SPEC := api/openapi.yaml
OPENAPI_SPEC_ADMIN := api/openapi-admin.yaml
OPENAPI_DIR := $(DIR_SOURCE)/generated/formeapi
OPENAPI_DIR_ADMIN := $(DIR_SOURCE)/generated/adminapi
OPENAPI_STAMP_VALIDATE := $(DIR_OUT)/stamp-openapi-validate
OPENAPI_STAMP_GENERATE := $(DIR_OUT)/stamp-openapi-generate

.PHONY: openapi-validate openapi-generate openapi-upgrade generate

help-body::
	@$(call HELP_HEADING,-,OpenAPI targets)
	@$(HELP) "* openapi" "openapi-validate & openapi-generate"
	@$(HELP) "* openapi-validate" "validates spec $(OPENAPI_SPEC), $(OPENAPI_SPEC_ADMIN)"
	@$(HELP) "* openapi-generate" "generate codes from spec $(OPENAPI_SPEC), $(OPENAPI_SPEC_ADMIN)"
	@echo

openapi: openapi-validate openapi-generate

openapi-validate: $(OPENAPI_STAMP_VALIDATE)

openapi-generate: openapi-validate $(OPENAPI_STAMP_GENERATE)

generate:
	oazapfts ./api/openapi-admin.yaml ./src/generated/adminapi/index.ts
	oazapfts ./api/openapi.yaml ./src/generated/formeapi/index.ts

openapi-upgrade:
	$(DIR_ROOT)/scripts/openapi.sh upgrade

$(OPENAPI_STAMP_VALIDATE): $(OPENAPI_SPEC)
	$(DIR_ROOT)/scripts/openapi.sh validate $(OPENAPI_SPEC)
	$(DIR_ROOT)/scripts/openapi.sh validate $(OPENAPI_SPEC_ADMIN)
	touch $@

$(OPENAPI_STAMP_GENERATE): $(OPENAPI_SPEC)
	$(DIR_ROOT)/scripts/openapi.sh generate $(OPENAPI_SPEC) $(OPENAPI_DIR)
	$(DIR_ROOT)/scripts/openapi.sh generate $(OPENAPI_SPEC_ADMIN) $(OPENAPI_DIR_ADMIN)
	touch $@
