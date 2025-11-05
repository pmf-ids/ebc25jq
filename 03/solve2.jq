#!/usr/bin/env -S jq -Rf

"[\(.)]" | fromjson | unique[:20] | add
