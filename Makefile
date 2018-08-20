# LaTeX CV/Resume Makefile
# D. Hellfeld 8.20.18

CV = cv
RESUME = resume

LATEXENGINE = pdflatex

LOGDIR = logs
PDFDIR = pdfs

G := $(shell tput -Txterm setaf 2)
Y := $(shell tput -Txterm setaf 3)
W := $(shell tput -Txterm setaf 7)

.PHONY: initialize $(CV) $(RESUME) all clean help

all: initialize $(CV) $(RESUME)

$(CV): initialize
	$(LATEXENGINE) --shell-escape --output-directory=$(LOGDIR) $(CV).tex
	@mv $(LOGDIR)/$(CV).pdf $(PDFDIR)
	@open $(PDFDIR)/$(CV).pdf

$(RESUME): initialize
	$(LATEXENGINE) --shell-escape --output-directory=$(LOGDIR) $(RESUME).tex
	@mv $(LOGDIR)/$(RESUME).pdf $(PDFDIR)
	@open $(PDFDIR)/$(RESUME).pdf

initialize:
	@mkdir -p $(LOGDIR)
	@mkdir -p $(PDFDIR)

clean:
	@echo "Cleaning up..."
	@rm -rf $(LOGDIR)
	@rm -rf $(PDFDIR)

help:
	@echo ''
	@echo '${W}Usage:'
	@echo '  ${Y}make ${G}<target>'
	@echo ''
	@echo '${W}Targets:'
	@echo '  ${Y}cv          ${G} - Build CV'
	@echo '  ${Y}resume      ${G} - Build resume'
	@echo '  ${Y}all         ${G} - Build both resume and CV (default if no target is specified)'
	@echo '  ${Y}clean       ${G} - Remove build directory'
	@echo '  ${Y}help        ${G} - Display this help'
	@echo ''
