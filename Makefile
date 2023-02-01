.POSIX:
.SUFFIXES:

LIBS=-lfreetype
VARS=LD_LIBRARY_PATH=/usr/lib:${LD_LIBRARY_PATH}

test:
	test ! -f EBGaramond-Regular.ttf && wget 'https://vladh.net/static/EBGaramond-Regular.ttf' || true
	mkdir -p bin
	$(VARS) hare build $(LIBS) -o bin/test cmd/test

run:
	$(VARS) hare run $(LIBS) cmd/test

.PHONY: test run
