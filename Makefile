EXEC = bin-swap bin-bubble bin-merge
.PHONY: all
all: $(EXEC)

CC ?= gcc
CFLAGS = -std=gnu99 -Wall -O2 -g
LDFLAGS =

OBJS := \
	swap.o \
	bubble.o \
	stub.o \
	merge.o

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

bin-%: %.o stub.o
	$(CC) -o $@ $^ $(LDFLAGS)

check: $(EXEC)
	bash test-swap.sh data-swap.in result-swap
	bash test-bubble.sh data-bubble.in result-bubble

clean:
	$(RM) $(EXEC) $(OBJS)
