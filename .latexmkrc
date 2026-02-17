# latexmk config for this template:
# keep all intermediate and output files under ./build
$out_dir = 'build';
$aux_dir = 'build';

# Build PDF with pdflatex.
$pdf_mode = 1;

# Match the Makefile's non-interactive, fail-fast behavior.
$interaction = 'nonstopmode';
$halt_on_error = 1;

