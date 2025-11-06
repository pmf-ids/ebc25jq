#!/usr/bin/env -S jq -sf

reduce .[keys[:-1][]:] as [$m,$n] (2025; . * $m/$n) | round
