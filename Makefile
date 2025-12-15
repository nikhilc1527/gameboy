CC = gcc
CFLAGS = -Wall -g
LDFLAGS =

SDL3_PKG ?= sdl3
PKG_CHECK := $(shell pkg-config --exists $(SDL3_PKG); echo $$?)
ifeq ($(PKG_CHECK),0)
	CFLAGS += $(shell pkg-config --cflags $(SDL3_PKG))
	LDFLAGS += $(shell pkg-config --libs $(SDL3_PKG))
else
	$(error pkg-config could not find $(SDL3_PKG). Install SDL3 dev files or set SDL3_PKG)
endif


SRC = gbemu.c
OBJ = $(SRC:.c=.o)
TARGET = gbemu

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(TARGET)
