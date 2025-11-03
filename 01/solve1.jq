#!/usr/bin/env -S jq -Rnrf

[inputs / ","] | (first | length - 1) as $n | first[reduce last[] as $d (0;
  fmax(0; fmin($n; . + {L: -1, R: 1}[$d[:1]] * ($d[1:] | tonumber)))
)]
