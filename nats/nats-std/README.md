# nats-std

## problem

Need NATS to call golang binaries over std. For example deck.

For Insiders, the binaries expose STDIN, STDOUT and STDERROR that Nats can call.
BTW this makes testing binaries very easy and maintains unix philosphy. 
We loose type sharing between things, but thats why we have tests. Deck has HEAPS of it.

So we can somehow wire up NATS pub sub to call a binary over STD, to allow pipelining.
The Editor and Deck Renderers use this. The messages are deck AST, XML flying though NATS using im memory ( we dont need disk ). Is fast....

## solution

Not sue yet.

uroot has some good stuff. Its busybox in pure golang.
https://github.com/u-root/u-root/tree/main/cmds/core



