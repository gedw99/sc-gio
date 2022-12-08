# 4-xml 

xml reflection in Deck is a problem for tinygo.

## Problem

https://github.com/ajstarks/deck/blob/master/deck.go#L5:
``` 

import (
	"encoding/xml"
```

- web: cant compile with tinygo
- web: huge wasm binary 

The whole of https://github.com/ajstarks/deck/blob/master/deck.go would need to be rewritten.



## Solutions

One of many golang libs that do xml decodering and xpath that does NOT use relfection.

https://github.com/clbanning/mxj

- good enough for hugo :) https://github.com/gohugoio/hugo/pull/9044
  - also shows how 3-web-dom could be solved. deckxml --> hugo

- 

---

Drop XML and use a very very tight format...

I dont really want to go down this path unles ist REALLY needed.

