# 2-interactive

## problem

slides are static which for some situations is enough, but not for those uses cases where they want to collect data from the user or navigate between slides ( like any app nav )

for example:

- to have a nav area, where you can click and navigate to another slide 
- to be able to do thngs like rect click --> collect form data --> post to channel.

NUTE: it could be that composition is needed before this but i suspect its part of interactive actually. Composition is file based routing where you can do an include of one slide into another.

## solution

- htmx is a nice pattern. https://htmx.org 

- uses simple construct with no language / logic needed. Just supply the right meta and its works.

- there are various golang implemenations in golang

