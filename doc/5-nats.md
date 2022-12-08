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

For Insiders, we have 