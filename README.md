# sc-gio

This is the main repo of the Open Scince project GUI.

Its very much a work in progress as we try approaches out.

Its made up of an Editor and Renderer. 

## Editor

The GUI to allow you to edit the source via a WYSIWYG GUI.

When you chane something, we rewrite the IDL source and the Renderer redraws.

## Renderer

This uses the Deck files as souce. Its event loop is simple in that when the source file changes all files are reprocessed.

The Files live on the backend, but we may later we able to have the files in the Browser itself.

Render targets are:
PDF; PNG, SVG, Web outputs.

It allows Single sourcing so that you can use just the Deck source to output all the Rendering targets at once.



