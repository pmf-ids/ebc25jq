#!/usr/bin/env -S jq -Rf

[scan("-?\\d+") | [tonumber + range(1001)]] | add(
  combinations as [$a,$b] | 1 | if any(foreach range(99) as $_ ([$a,$b]; [
    $a + ((pow(first; 2) - pow(last; 2)) / 1e5 | trunc),
    $b + (first * last * 2e-5 | trunc)
  ]; map(fabs) | max > 1e6); .) then empty end
)
