# nats


MAKE_FSPATH=$(PWD)/../make
include $(MAKE_FSPATH)/help.mk
include $(MAKE_FSPATH)/nats.mk


this-dep:
	$(MAKE) nats-dep




this-test:
	# https://github.com/choria-io/fisk#cheats
	nats cheat --list
	nats cheat pub
	nats cheat server 

	#nats pub destination.subject "{{ Random 100 1000 }}" -H Count:{{ Count }} --count 100
	#echo "hello world" | nats pub destination.subject
	