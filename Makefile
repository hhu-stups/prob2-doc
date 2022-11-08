ASCIIDOCTOR := asciidoctor
ASCIIDOCTOR_PDF := asciidoctor-pdf
ASCIIDOCTOR_OPTIONS := \
	--attribute imagesoutdir=build/images \
	--require asciidoctor-bibtex \
	--require asciidoctor-diagram \

BIBTEX_FILES := $(wildcard src/docs/bibtex/*.bib)
COMBINED_BIBTEX_FILE := src/docs/asciidoc/combined.bib

MAIN_FILE := src/docs/asciidoc/prob_handbook.adoc
CHAPTER_FILES := $(wildcard src/docs/asciidoc/chapter/Java_API/*.adoc)

.PHONY: all
all: build/prob_handbook.html build/prob_handbook.pdf

$(COMBINED_BIBTEX_FILE): $(BIBTEX_FILES)
	cat $^ > $@

build/prob_handbook.html: $(MAIN_FILE) $(CHAPTER_FILES) $(COMBINED_BIBTEX_FILE)
	$(ASCIIDOCTOR) $(ASCIIDOCTOR_OPTIONS) --destination-dir $(@D) --source-dir $(<D) $<
	cp src/docs/asciidoc/images/*.png build/images

build/prob_handbook.pdf: $(MAIN_FILE) $(CHAPTER_FILES) $(COMBINED_BIBTEX_FILE)
	$(ASCIIDOCTOR_PDF) $(ASCIIDOCTOR_OPTIONS) --destination-dir $(@D) --source-dir $(<D) $<

.PHONY: html
html: build/prob_handbook.html

.PHONY: pdf
pdf: build/prob_handbook.pdf

.PHONY: clean
clean:
	$(RM) -r build $(COMBINED_BIBTEX_FILE)