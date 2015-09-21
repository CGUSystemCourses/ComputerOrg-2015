###############################################################################
#
# files and directories setup
#
###############################################################################

updir1 = $(patsubst %/, %, $(dir $(PWD)))
updir2 = $(patsubst %/, %, $(dir $(updir1)))
updir3 = $(patsubst %/, %, $(dir $(updir2)))
updir4 = $(patsubst %/, %, $(dir $(updir3)))

MEMO_ROOT = $(updir1)

FIG_FILES += $(wildcard *.fig)
#FIG_WO_EPS = 
EPS_FILES += $(filter-out $(FIG_WO_EPS:.fig=.eps), $(FIG_FILES:.fig=.eps))

#EPS_FILES += FormAPDataPath.eps

LS_LIST = $(shell ls)
LOCAL_FILES = %.tex %.fig %.c %.eps %.ps %.bak Makefile %.txt %.ppt %.jpg
LOCAL_FILES += %.doc
SUBDIRS = $(filter-out $(LOCAL_FILES) CVS, $(LS_LIST))
SUBDIR_FIGURES = $(addsuffix .figures, $(SUBDIRS))
CLEANS = $(addsuffix .clean, $(SUBDIRS))



###############################################################################
#
# user interface
#
###############################################################################

refresh:
	make -C $(MEMO_ROOT) refresh;

all: $(SUBDIR_FIGURES) $(EPS_FILES)

clean: $(CLEANS)
	rm -f *.eps;
	rm -f *.bak;
	rm -f *.ps;
	rm -f *.jpg

clean_tmp:
	cd $(MEMO_ROOT); make clean_tmp

touch:
	touch $(MEMO_ROOT)/main.ps



###############################################################################
#
# file generation rules
#
###############################################################################

%.figures:
	cd $*; make all;

%.clean:
	make -C $* clean;

### figures from ArchIdea.fig ###

#SeaOfWireSW.eps: ArchIdea.fig
#	fig2dev -L eps -D +48,50,60 $^ $@;

#c_sample.ps: c_sample.c
#	enscript --no-header --pretty-print=c --tabsize=4 -p $@ $<

#c_sample.eps: c_sample.ps
#	ps2epsi $< $@

%.eps: %.fig
	fig2dev -L eps $^ $@

%.jpg: %.fig
	fig2dev -L jpeg $^ $@

























