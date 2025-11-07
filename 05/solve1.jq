#!/usr/bin/env -S jq -Rf

reduce [scan("\\d+") | tonumber][1:][] as $n ([];
  first((paths(. == null) as $p | setpath($p; $n)
    | select([.[$p | first][] | values] | . == unique)
  ), . + [[null, $n, null]])
) | map(.[1] | tostring) | add | tonumber
