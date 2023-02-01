.POSIX:
.SUFFIXES:

LIBS=-lfreetype
VARS=LD_LIBRARY_PATH=/usr/lib:${LD_LIBRARY_PATH}

test:
	mkdir -p bin
	$(VARS) hare build $(LIBS) -o bin/test cmd/test

run:
	$(VARS) hare run $(LIBS) cmd/test

.PHONY: test run
