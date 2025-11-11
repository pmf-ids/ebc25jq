#!/usr/bin/env -S jq -Rf

(reduce inputs as $r ({}; .[$r[:1]] = $r[4:] / ",")) as $rul | . / ","

| add(to_entries[] | select(all(
    .value | while(length > 1; .[1:]); IN(.[1:2]; $rul[.[:1]][])
  )).key + 1)
