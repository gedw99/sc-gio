# 5-nats

## problem

Outsiders - We have users coming in from the real world that dont speak NATS.

Insiders - we have processes running that need to be called. both binaries and wasm funcs
- the many deck binaries
- the future wasm funcs that manipulate the db tables.

## solution

For Outsiders,  we can use Caddy to proxy nats. 
- makes the api very precise.
- secure.
- AAA aware.
- The NATS endpoints are modelled in Caddy, and via NATS KV, we can update the Caddy config in real time, so the Endpoints are always matching those configured in NATS.

The nats-caddy folder has this works to a degree now.

---

For Insiders, the binaries we have binaires with STDIN, STDOUT and STDERROR that Nats can call.
BTW this makes testing binaries very easy and maintains unix philosphy. 
We loose type sharing between things, but thats why we have tests. Deck has HEAPS of it.

So we can simply wire up NATS pub sub to call a binary over STD, to allow pipelining.
The Editor and Deck Renderers use this. The messages are deck AST, XML flying though NATS using im memory ( we dont need disk ). Is fast....

The WASM can be wrireup up to NATS using various mechanisms. We only planned to have them as part of the DB Funcs 