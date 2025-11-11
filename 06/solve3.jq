#!/usr/bin/env -S jq -Rf

def b(i): bsearch(i) | if . < 0 then -. - 1 end; # stupid bsearch

1000 as $rep | 1000 as $win | ($win / length | ceil) as $div

| [(1,2) as $m | . * $m * $div | explode | ($rep / $div + $m - 3) * add(
    [indices("AaBbCc" | explode[])][0,2,4:][:2] | last[] as $n
    | first | b($n + 1 + $win) - b($n - $win)
  )] | last - first
