# xml reflection

https://github.com/ajstarks/deck/blob/master/deck.go#L5:
``` 

import (
	"encoding/xml"
```

## Problem

- web: cant compile with tinygo
- web: huge wasm binary 

## Solutions

One of many golang libs that do xml decodering and xpath that does NOT use relfection.

https://github.com/clbanning/mxj

- good enough for hugo :) https://github.com/gohugoio/hugo/pull/9044
  - also shows how 3-web-dom could be solved. deckxml --> hugo


---

Drop XML and use a very very tight format...

I dont really want to go down this path unles ist REALLY needed.

