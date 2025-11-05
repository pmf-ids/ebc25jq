#!/usr/bin/env -S jq -Rf

. / "," | map(tonumber) | group_by(.) | map(length) | max
