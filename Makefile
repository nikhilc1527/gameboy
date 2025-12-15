CC = gcc
CFLAGS = -Wall -g
LDFLAGS =

ifndef SDL3_DIR
	$(error "SDL3_DIR is not set. Please set it to the SDL3 installation path")
endif

CFLAGS += -I$(SDL3_DIR)\include
LDFLAGS += -L$(SDL3_DIR)\lib -lSDL3

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
