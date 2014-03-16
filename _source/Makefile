ARTICLES_DIR = ../articles
HTML_FILES := $(patsubst %.md, $(ARTICLES_DIR)/%.html ,$(wildcard *.md)) 
PDF_FILES := $(patsubst %.md, $(ARTICLES_DIR)/%.pdf ,$(wildcard *.md))
WORD_FILES := $(patsubst %.md, $(ARTICLES_DIR)/%.docx ,$(wildcard *.md)) 
PLAIN_HTML_FILES := $(patsubst %.md, $(ARTICLES_DIR)/%-plain.htm ,$(wildcard *.md)) 
MARKDOWN_FILES := $(patsubst %.md, $(ARTICLES_DIR)/%.md ,$(wildcard *.md)) 


all: html pdf word plain-html markdown

html: $(HTML_FILES) 

pdf: $(PDF_FILES)

plain-html: $(PLAIN_HTML_FILES)

markdown: $(MARKDOWN_FILES)

word: $(WORD_FILES)

$(ARTICLES_DIR)/%.html: %.md
	pandoc -s --smart --ascii --base-header-level=2 \
	       --template=templates/article.html \
	       --variable=article:$* \
	       $< -o $@

$(ARTICLES_DIR)/%.pdf: %.md
	pandoc $< --variable geometry:margin=1in --variable fontsize=12pt -o $@

$(ARTICLES_DIR)/%.docx: %.md
	pandoc $< -o $@

$(ARTICLES_DIR)/%-plain.htm: %.md
	pandoc -s --smart --ascii --base-header-level=2 \
       --template=templates/article-plain.html \
       $< -o $@

$(ARTICLES_DIR)/%.md: %.md
	cp $< $@


.PHONY: clean
clean:
	$(RM) $(ARTICLES_DIR)/*




