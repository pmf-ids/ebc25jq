#!/usr/bin/env -S jq -Rf

(reduce inputs as $r ({}; .[$r[:1]] = $r[4:] / ",")) as $rul | . / ","

| map(
    select(all(while(length > 1; .[1:]); IN(.[1:2]; $rul[.[:1]][])))
    | until(length >= 7; . + $rul[.[-1:]][])[:7]
  ) | [unique[][-1:]]
| [group_by(.) | map(length), map(
    [first] | reduce range(4) as $_ (.; . + map(. + $rul[.[-1:]][]?))
    | unique | length
  )] | add(transpose[] | first * last)
