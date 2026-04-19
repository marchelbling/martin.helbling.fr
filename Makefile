REPO_ROOT := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
BUILD_DIR := $(REPO_ROOT)/docs

.PHONY: build
build: build-words build-phonemes

.PHONY: generate
generate: clean build
	mkdir -p $(BUILD_DIR)
	cp -R $(REPO_ROOT)/static/. $(BUILD_DIR)/
	echo "martin.helbling.fr" > $(BUILD_DIR)/CNAME

.PHONY: build-words
build-words:
	cd $(REPO_ROOT)/apps/words && npm install && npm run build-all

.PHONY: test-words
test-words:
	cd $(REPO_ROOT)/apps/words && npm install && npm test

.PHONY: words-audio
words-audio:
	$(REPO_ROOT)/apps/words/scripts/generate_audio.py

.PHONY: build-phonemes
build-phonemes:
	cd $(REPO_ROOT)/apps/phonemes && npm install && npm run build-all

.PHONY: test-phonemes
test-phonemes:
	cd $(REPO_ROOT)/apps/phonemes && npm install && npm test

.PHONY: phonemes-audio
phonemes-audio:
	$(REPO_ROOT)/apps/phonemes/scripts/generate_audio.py

.PHONY: local
local: build
	cd $(REPO_ROOT)/static && python3 -m http.server 8000

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(REPO_ROOT)/static/apps/words/js $(REPO_ROOT)/static/apps/phonemes/js
	rm -rf $(REPO_ROOT)/apps/words/dist $(REPO_ROOT)/apps/phonemes/dist
