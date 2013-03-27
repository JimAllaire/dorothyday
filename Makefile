
all: source
	

source:
	$(MAKE) -C _source

.PHONY: clean
clean:
	$(RM) -rf _site
	$(MAKE) clean -C _source

