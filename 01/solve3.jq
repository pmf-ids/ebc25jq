#!/usr/bin/env -S jq -Rnrf

[inputs / ","] | (first | length) as $n | first[(
  reduce last[] as $d ([range($n)];
    ({L: -1, R: 1}[$d[:1]] * ($d[1:] | tonumber % $n)) as $i
    | [.[$i]] + (.[$i] = first)[1:]
  )
)[0]]
