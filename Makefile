####################################################
# Students' Makefile for the Processor Lab
####################################################

# Default student ID number and version
ID = 0000-00000

HANDINDIR = $(ID)
HANDINDIR-PARTA = $(HANDINDIR)/parta
HANDINDIR-PARTB = $(HANDINDIR)/partb

sim:
	(cd sim; make)

# Use this rule to hand all parts
handin: pre-handin handin-parta handin-partb post-handin

pre-handin:
	################################
	# Creating directory structure #
	################################
	mkdir -p $(HANDINDIR)
	mkdir -p $(HANDINDIR-PARTA)
	mkdir -p $(HANDINDIR-PARTB)
	touch $(HANDINDIR)/created_timestamp.txt
	date > $(HANDINDIR)/created_timestamp.txt

post-handin:
	################################
	# Compressing handin directory #
	################################
	tar -zcf $(HANDINDIR).tgz $(HANDINDIR)
	@echo ""
	@echo ""
	@echo ""
	@echo "****************************************************************************"
	@echo "Handin generated. Email the file $(HANDINDIR).tgz to comparch@csap.snu.ac.kr"
	@echo "****************************************************************************"
	@echo ""
	@echo ""

handin-parta:
	############################
	# Copying files for Part A #
	############################
	cp sim/seq/seq-full.hcl $(HANDINDIR-PARTA)/
	cp sim/pipe/pipe-full.hcl $(HANDINDIR-PARTA)/
	cp sim/misc/yas-grammar.lex $(HANDINDIR-PARTA)/
	cp sim/misc/isa.c $(HANDINDIR-PARTA)/

handin-partb:
	############################
	# Copying files for Part B #
	############################
	cp sim/pipe/pipe-full-optimized.hcl $(HANDINDIR-PARTB)/
clean:
	rm -f *~ *.o

cleanhandin:
	rm -rf $(HANDINDIR)*

