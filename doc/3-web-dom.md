# web

In a brower we currently render to the webgl canvas

The only reason we need to render to DOM is the search engines

- Making a deck renderer that can do that is very easy because its just the content of the deck xml.
- We can sniff the user agent, and if its google bot, then give it the Deck Wen DOm renderer.
- It will be interesting to see if both can run at the same time ( Webgl and Web dom) and only show the webgl visually.. 
- Accoridng to google this is not illegal ( aka called cloaking), but only way to find out to to get some stuff up and tell Google Web Master to go and hit the test web site.

