#!/usr/bin/env bash
# Build the CV from papers/cv.typ into:
#   papers/cv.pdf      — the print/download PDF (linked from the menu's "CV")
#   _includes/cv.html  — the <body> of the HTML export, embedded by the Jekyll
#                        page papers/cv.html so the web CV renders inside the
#                        site layout, styled by assets/css/styles.css.
#
# Run this whenever papers/cv.typ changes, then commit cv.pdf and
# _includes/cv.html (GitHub Pages runs Jekyll but not Typst).
#
# Note: --features html is required even for the PDF, because cv.typ calls
# target(), which is gated behind that (still-experimental) feature flag.
set -euo pipefail

cd "$(dirname "$0")/.."   # repo root

typst compile papers/cv.typ papers/cv.pdf --features html

tmp="$(mktemp -t cv).html"
trap 'rm -f "$tmp"' EXIT
typst compile papers/cv.typ "$tmp" --features html

python3 - "$tmp" _includes/cv.html <<'PY'
import re, sys
src, out = sys.argv[1], sys.argv[2]
html = open(src, encoding="utf-8").read()
m = re.search(r"<body[^>]*>(.*)</body>", html, re.S)
body = (m.group(1) if m else html).strip()
header = "<!-- Generated from papers/cv.typ by papers/build_cv.sh. Do not edit. -->\n"
open(out, "w", encoding="utf-8").write(header + body + "\n")
PY

echo "Wrote papers/cv.pdf and _includes/cv.html"
