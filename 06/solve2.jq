#!/usr/bin/env -S jq -Rf

explode | [indices("AaBbCc" | explode[])]
| add(.[0,2,4:][:2] | last[] as $n | first | -bsearch($n) - 1)
