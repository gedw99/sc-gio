# web

In a brower we currently render to the webgl canvas.

## Problem

Search engines index the DOM, and so users wont get indexed.

## Solutions

Render to the DOM just the stuff a search engine needs

- Making a deck renderer that can do that is very easy because its just the content of the deck xml.
- We can sniff the user agent, and if its google bot, then give it the Deck Wen DOm renderer.
- It will be interesting to see if both can run at the same time ( Webgl and Web dom) and only show the webgl visually.. 
- Accoridng to google this is not illegal ( aka called cloaking), but only way to find out to to get some stuff up and tell Google Web Master to go and hit the test web site.

---

Render out to Hugo. 

- Search engine are happy
- Users that dont want GIO are happy

- Its impossible to main both though in tandem. The decksh and the hugo layout. 
- This is why i looked at the Vugu option ...


