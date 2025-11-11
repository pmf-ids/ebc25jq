#!/usr/bin/env -S jq -Rrf

(reduce inputs as $r ({}; .[$r[:1]] = $r[4:] / ",")) as $rul | . / ","

| first(.[] | select(all(
    while(length > 1; .[1:]); IN(.[1:2]; $rul[.[:1]][])
  )))
