# PROJECT_ORG is required
ifeq ($(PROJECT_ORG),)
$(error PROJECT_ORG is not defined)
endif

# PROJECT_SERVICE is required
ifeq ($(PROJECT_SERVICE),)
$(error PROJECT_SERVICE is not defined)
endif

# PROJECT_TYPE is required
ifeq ($(PROJECT_TYPE),)
$(error PROJECT_TYPE is not defined)
endif

PROJECT_NAME := $(PROJECT_SERVICE)-$(PROJECT_TYPE)
ifneq ($(PROJECT_CONTEXT),)
PROJECT_NAME := $(PROJECT_NAME)-$(PROJECT_CONTEXT)
endif
ifneq ($(PROJECT_APPENDIX),)
PROJECT_NAME := $(PROJECT_NAME)-$(PROJECT_APPENDIX)
endif

# PROJECT_ENV from git branch
PROJECT_GIT_BRANCH ?= $(shell git branch --show-current)
ifeq ($(PROJECT_GIT_BRANCH),develop)
PROJECT_ENV := d
else ifeq ($(PROJECT_GIT_BRANCH),main)
PROJECT_ENV := p
else
PROJECT_ENV := d
$(warning ### Current branch is neither 'develop' nor 'main')
endif
