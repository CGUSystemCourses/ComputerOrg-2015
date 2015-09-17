FIG_FILES += $(wildcard *.fig)
JPG_FILES += $(FIG_FILES:.fig=.jpg)
EPS_FILES += $(FIG_FILES:.fig=.eps)

TARGETS = $(JPG_FILES)
GENERATED_FILES = $(JPG_FILES) $(EPS_FILES)

all: $(TARGETS)

clean:
	rm -f $(GENERATED_FILES)
	rm -f *.bak

%.jpg: %.fig
	fig2dev -L jpeg $< $@

%.eps: %.fig
	fig2dev -L eps $< $@








