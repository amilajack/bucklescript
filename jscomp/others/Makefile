include ../Makefile.shared

COMPILER=../bin/bsc

MAP_FILES= bs_node bs 

SOURCE_LIST=  bs_node_path bs_node_fs bs_node_process bs_dict bs_node_module

$(addsuffix .cmj, $(MAP_FILES)): bs_node.cmj bs.cmj

RUNTIME := $(addsuffix .cmj, $(SOURCE_LIST)) 

BS_COMMON_FLAGS= -no-alias-deps -bs-no-version-header -bs-diagnose -bs-no-check-div-by-zero -bs-cross-module-opt -bs-package-name $(npm_package_name)

ifdef BS_RELEASE_BUILD
BS_FLAGS=  $(BS_COMMON_FLAGS) -bs-package-output lib/js -bs-package-output goog:lib/goog -bs-package-output amdjs:lib/amdjs
else
BS_FLAGS=  $(BS_COMMON_FLAGS) -bs-package-output lib/js 
endif

COMPFLAGS += $(BS_FLAGS)  -I ../runtime -I ../stdlib -w -40 -w -49



$(RUNTIME): $(COMPILER)

all: $(RUNTIME)

clean::
	rm -f *.cm*
	rm -f *~
	rm -f  *.annot
	rm -f *.rawlambda *.lam *.lambda *.map


.mli.cmi:
	$(COMPILER) $(INCLUDES) $(COMPFLAGS)  -c $<
.ml.cmj:
	$(COMPILER) $(INCLUDES) $(COMPFLAGS)  -c $<


-include .depend

ML_SOURCES=$(addsuffix .ml, $(SOURCE_LIST))
MLI_SOURCES=$(addsuffix .mli, $(SOURCE_LIST))
depend:
	$(CAMLDEP) $(INCLUDES) $(ML_SOURCES) $(MLI_SOURCES) | sed -e 's/\.cmo/.cmj/g' > .depend
	$(CAMLDEP) $(INCLUDES) $(ML_SOURCES) | sed -e 's/\.cmx/.cmj/g' >>.depend

