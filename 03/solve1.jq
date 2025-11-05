#!/usr/bin/env -S jq -Rf

"[\(.)]" | fromjson | unique | add
