#!/usr/bin/env bash
# Build resumes and cover letters to PDF with Typst.
#   scripts/build-pdfs.sh                 builds everything
#   scripts/build-pdfs.sh master <name>   builds only the master and/or the named variants
# Output:
#   master-resume.typ          -> dist/master/<PDF_PREFIX>resume.pdf
#   variants/<name>/<file>.typ -> dist/variants/<name>/<PDF_PREFIX><file>.pdf
# Set PDF_PREFIX (for example PDF_PREFIX=Jane-Doe-) to put your name on each file.
# All of them import the shared layout in templates/layout.typ.
set -euo pipefail
cd "$(dirname "$0")/.."
out=dist
prefix="${PDF_PREFIX:-}"

targets=("$@")
if [ ${#targets[@]} -eq 0 ]; then
  targets=(master)
  for dir in variants/*/; do [ -d "$dir" ] && targets+=("$(basename "$dir")"); done
fi

for target in "${targets[@]}"; do
  if [ "$target" = master ]; then
    rm -rf "$out/master" && mkdir -p "$out/master"
    typst compile --root . master-resume.typ "$out/master/${prefix}resume.pdf"
    echo "built $out/master/${prefix}resume.pdf"
    continue
  fi
  [ -d "variants/$target" ] || { echo "no variant: $target" >&2; exit 1; }
  rm -rf "$out/variants/$target" && mkdir -p "$out/variants/$target"
  for src in "variants/$target"/*.typ; do
    pdf="$out/variants/$target/${prefix}$(basename "$src" .typ).pdf"
    typst compile --root . "$src" "$pdf"
    echo "built $pdf"
  done
done
