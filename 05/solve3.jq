#!/usr/bin/env -S jq -Rnf

[inputs | [scan("\\d+") | tonumber] | [(
  reduce .[1:][] as $n ([];
    first((paths(. == null) as $p | setpath($p; $n)
      | select([.[$p | first][] | values] | . == unique)
    ), . + [[null, $n, null]])
  ) | map(.[1]), (.[] | map(values)) | map(tostring) | add | tonumber
), first]] | sort | add(keys[] as $k | (.[$k] | last) * (length - $k))
