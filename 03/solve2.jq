#!/usr/bin/env -S jq -Rf

. / "," | map(tonumber) | unique[:20] | add
