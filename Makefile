
# Build data
VERSION    = 1.0.0
PROJECT    = myCustomAction

GO         = GO111MODULE=on go
GOBUILD    = $(GO) build
GOARCH     = $(shell go env GOARCH)
GOOS       = $(shell go env GOOS)
MAIN       = ./cmd/main.go

DIR_BUILD          = build

.PHONY: install
install: ; @ ## Install project dependencies
	GOSUMDB=off $(GO) mod download

.PHONY: build
build: install ; @ ## Build project binaries in your OS
	GOARCH=$(GOARCH) GOOS=$(GOOS) $(GOBUILD) -o $(DIR_BUILD)/$(PROJECT).$(GOOS)  $(MAIN)

.PHONY: build_all
build_all: install ; @ ## Builds project binaries (linux, darwin, windows)
	GOARCH=amd64 GOOS=linux  $(GOBUILD) -o $(DIR_BUILD)/$(PROJECT).linux  $(MAIN)
	GOARCH=amd64 GOOS=darwin $(GOBUILD) -o $(DIR_BUILD)/$(PROJECT).darwin $(MAIN)
	GOARCH=amd64 GOOS=windows $(GOBUILD) -o $(DIR_BUILD)/$(PROJECT).exe $(MAIN)