# https://www.notion.so/haii/Repository-dcd44583e2444f15b7cf48b07c81f68b
PROJECT_ORG := chan
PROJECT_SERVICE := lotto
PROJECT_TYPE := app
PROJECT_CONTEXT := web

include build/common.mk
include build/openapi.mk
include build/npm.mk
include build/project.mk
include build/firebase.mk
