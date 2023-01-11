# benthos

Used as the processing engine between the Editor and the binaries using stdio.

later can be used for data transformation and even actions to make things dynamic with Deck.

--- 

So the chain pipe is NATS  ( Editor ) —> subprocess —> Deck binary —> NATS ( to Editor )

Subprocess doc:
https://www.benthos.dev/docs/components/inputs/subprocess


https://github.com/benthosdev/benthos/blob/main/website/docs/components/inputs/subprocess.md


Subprocess test showing how to hard code wire it up, which we might want to do

https://github.com/benthosdev/benthos/blob/main/internal/impl/io/processor_subprocess_test.go


Examples:
https://github.com/search?q=benthos+subprocess&type=code

https://github.com/wikimedia/operations-debs-benthos/blob/master/internal/impl/io/output_subprocess.go
- nice

---


NATS 
https://www.benthos.dev/docs/components/inputs/nats/
