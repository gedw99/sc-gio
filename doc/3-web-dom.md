# 3- web

In a brower we currently render to the webgl canvas.

## Problem

Search engines index the DOM, and so users wont get their app indexed.

## Solutions

Render to the DOM just the stuff a search engine needs.

- Making a deck renderer that can do that is very easy because its just the contents of the deck xml, fed into a specialised Deck Renderer. I call it the Deck Web DOM  ( DWD ) renderer
- We can sniff the user agent, and if its google bot, then give it the DWD renderer.
- It will be interesting to see if both can run at the same time ( GIO Renderer and DWD Renderer) and only show the webgl visually.. 
- According to google this is not illegal ( aka called cloaking ), but only way to find out to to get some stuff up and tell Google Web Master to go and hit the test web site.

---

Render out to Hugo ...

- There are a few ways to feed markdown / images / video to Hugo from the Slides. 
- A Hugo Renderers running off the Deck XML is one way, outputting markdown, etc
- Probably others too.

--- 

Vugu option ...

https://github.com/vugu/vugu

- This is why i looked at the Vugu option ...

--- 

Astro option.

https://github.com/withastro/compiler

MDL example
- https://github.com/rodydavis/material-design-lite/tree/mdl-3.x/examples/vue
- demo:  https://rodydavis.github.io/material-design-lite/overview/
- playground: https://github.com/rodydavis/astro-playground-elements






