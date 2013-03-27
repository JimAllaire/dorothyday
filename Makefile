
all: source
	

source:
	$(MAKE) -C _source

.PHONY: clean
clean:
	$(RM) -rf _site
	$(MAKE) clean -C _source

preview: source
	jekyll --server --auto --url http://localhost:4000

