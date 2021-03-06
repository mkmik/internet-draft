#!/usr/bin/env bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(

cd "$script_dir/.."

kdrfc -h3 draft-normington-jsonpath-latest.md && \
xmlstarlet sel -T -t -v '//artwork[@type="abnf"]' ./draft-normington-jsonpath-latest.xml 2>/dev/null \
| aex \
| bap -S path -q && cp draft-normington-jsonpath-latest.html docs/index.html
)
