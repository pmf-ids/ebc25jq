#!/usr/bin/env -S jq -Rnrf

[inputs / ","] | (first | length) as $n | first[
  [last[] | {L: -1, R: 1}[.[:1]] * (.[1:] | tonumber)] | add % $n
]
