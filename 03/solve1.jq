#!/usr/bin/env -S jq -Rf

. / "," | map(tonumber) | unique | add
