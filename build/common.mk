DIR_ROOT := $(CURDIR)
DIR_CMD := $(DIR_ROOT)/cmd
DIR_DEPLOYMENTS := $(DIR_ROOT)/deployments
DIR_SOURCE := $(DIR_ROOT)/src
DIR_OUT := $(DIR_ROOT)/dist
DIR_PUBLIC := $(DIR_ROOT)/public
DIR_SCRIPTS := $(DIR_ROOT)/scripts
DIR_CONFIGS := $(DIR_ROOT)/configs

HELP := printf "%-23s%s\n"

define HELP_HEADING
echo $(2)
$(DIR_SCRIPTS)/repeat.sh $(1) $(shell printf "$(2)" | wc -c)
endef

ifeq ($(V),)
.SILENT:
endif

.EXPORT_ALL_VARIABLES:

.PHONY: help help-header help-body help-footer

help: help-header help-body help-footer

help-header:
	@echo
	@$(call HELP_HEADING,=,Project $(PROJECT_NAME))
	@echo

help-footer:
	@echo "---"
	@echo
	@echo "To wipe out completely, just do \`rm -rf $(DIR_OUT)\`"
	@echo

$(DIR_OUT):
	mkdir -p $(DIR_OUT)

*: $(DIR_OUT)
