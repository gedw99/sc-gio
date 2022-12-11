# wasm nats

Browser needs a way to call NATS from WASN,

- prefer to not have to use js, etc 

https://github.com/oderwat started it but 
- https://github.com/maxence-charriere/go-app/issues/789

https://github.com/oderwat/go-nats-app


---

https://github.com/mlctrez extended it.

https://github.com/mlctrez/goapp-natsws/blob/master/proxy/proxy.go
This allows the wasm nats client to connect to the same host:port where the go-app is hosted
its reusable design.
not sure if failover is there.


https://github.com/mlctrez/go-nats-app
nats.InProcessServer - very very cool 

---

https://github.com/stevegt is also doing this.

https://github.com/maxence-charriere/go-app/issues/792
also into idea.
 It also generates static pre-rendered HTML files for SEO purposes. !! 

 https://www.reddit.com/r/golang/comments/zh7mk3/goapp_for_a_production_decentralized_wasm/

https://github.com/stevegt/goalmap is very cool little markdown to graph / graphviz
- will make it easy to build graph displasy of the NATS pub / sub linkages, by just materialising the markdown out of NATS tools at runtime.