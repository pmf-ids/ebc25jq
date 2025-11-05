#!/usr/bin/env -S jq -Rf

"[\(.)]" | fromjson | [group_by(.)[] | length] | max
