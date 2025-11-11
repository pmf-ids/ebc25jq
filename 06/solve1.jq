#!/usr/bin/env -S jq -Rf

explode | [indices("Aa" | explode[])]
| add(last[] as $n | first | -bsearch($n) - 1)
