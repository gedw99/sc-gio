# 7-binaries

## problem

There are ours, third parties and future binaries used to run the system. It will only get more and more.

We need a way to bundle them and have their 256sha checked.

## solution

Hermit does it :)
 
When you install the system your installed one binary that is a Root binary.

The Root binary them pulls all the binaries.

NATS then pipelines them together over STDIN, etc as par NATS doc. 

Its very simple.

Root binary
- Suture ( supervision trees ) looks useful here
  - https://pkg.go.dev/github.com/thejerf/suture/v4
  - Must include:
    - nats-server ( embedded )
    - pocketbase
    - caddy-nats
- The other way is to just use XCaddy to include the other bits we need.
  - nats, etc 

Tracking
- https://stackoverflow.com/questions/68921825/how-to-determine-which-module-s-use-an-indirect-dependency
  - just so see when i need this..

Upgrades

- You just rerun the Root bootstrap and it will get any new binaires.
  
- For Insiders you dont have to worry about process slipstreaming or blue / green deployments because NATS will buffer until the binary is replaced. Have to check this is really true in practice. 


- For goes for Outsiders, because as long as NATS is alive, NAT-Caddy domain calls will be buffered. 

