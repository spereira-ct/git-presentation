BUILD_DIR=build
TEX2PDF=pdflatex
TEX2PDF_OPTS=-file-line-error -output-directory $(BUILD_DIR) -shell-escape

.PHONY : all clean

all: $(BUILD_DIR)/git-introductie.pdf

$(BUILD_DIR)/git-introductie.pdf: git-introductie.tex source/* $(BUILD_DIR)
	$(TEX2PDF) $(TEX2PDF_OPTS) $<
	$(TEX2PDF) $(TEX2PDF_OPTS) $<

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Removing the .bbl and .aux files before a run is recommended to avoid
# spurious error messages that might corrupt the .aux file currently
# being generated.
clean:
	@rm -f $(BUILD_DIR)/*
