#!/usr/bin/env -S jq -Rcf

[scan("\\d+") | 10 * tonumber] as [$a,$b] | reduce range(3) as $_ ([0,0]; [
  ($a + first * first - last * last, $b + first * last * 2) / 10 | trunc
])
