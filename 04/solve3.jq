#!/usr/bin/env -S jq -Rsf

reduce ((. / "|")[] | [scan("\\d+") | tonumber]) as [$m,$n] (100; . * $m/$n) | round
