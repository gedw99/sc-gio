# README

- We are going for "just get it working, and we make is nice later "


- Client: Get the Editor working.
  - working off a single decksh file like: deck/decksh/test.dsh
  - Left Pane ( GIO Editor) , Right Pane ( GIO Renderer )
  - Get NATS or Web Sockets pumping between the File ( OS level) and GUI
  - Make a Designer for, for example, ``` ctext "decksh tests" 50 50 10 ``` 
  - When you double click into the ``` ctext ```the Designer is inlined, and rendered. 
    - This requires use forking deck and making some modifications. 
    - Only do enough to just get ctext working, so that we dont 
    - the line numbers are our context. We are literally over writing the decksh lines, and then the pipe / event loop spits out the GIO canvas ( in the Right pane.)
    - We onyl have a Left abd right pane so that for debugging purposes we can see whats going on.
      - we might want a source code and event pane to later.
   - Make it work in Browser. nats.ws 
   - Make it work in Native. nats.go
  - Get it into github CI / CD on deploying fly.io 
    - Needs docker file.

- Server and DB: Get a Server that includes a DB 
  - use Pocketbase: https://github.com/pocketbase/pocketbase
  - Just import the core and we have a server, db,  gui. 3 lines !!.
  - Add to the docker file.

- Drive: Get OCIS added into FLY.io. 
  - Use Hermit. so all we need are the binaries !!
  - https://github.com/cashapp/hermit
  - Will need a simple dockerfile to include the binary

- Public Server and Private Server
 - Both use Pocket base. 
 - We use NATS to allow the Publc server to reach the private server.
   - Caddy-NATS: https://github.com/codegangsta/caddy-nats
