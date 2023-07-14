#
# Copyright (c) Riverdi Sp. z o.o. sp. k. <riverdi@riverdi.com>
# Copyright (c) Skalski Embedded Technologies <contact@lukasz-skalski.com>
#

# Project name
PROJECT = riverdi-demo

# List all C defines here

DEFS = -DLINUX_PLATFORM
DEFS += -DBUFFER_OPTIMIZATION

#DEFS += -DEVE_1
#DEFS += -DEVE_2
#DEFS += -DEVE_3
DEFS += -DEVE_4

#DEFS += -DEVE_4_INTERNAL_OSC
DEFS += -DEVE_4_EXTERNAL_OSC

#DEFS += -DNTP_35
#DEFS += -DRTP_35
#DEFS += -DCTP_35
#DEFS += -DNTP_43
#DEFS += -DRTP_43
#DEFS += -DCTP_43
#DEFS += -DNTP_50
#DEFS += -DRTP_50
#DEFS += -DCTP_50
#DEFS += -DNTP_70
#DEFS += -DRTP_70
#DEFS += -DCTP_70
#DEFS += -DIPS_35
#DEFS += -DIPS_43
#DEFS += -DIPS_50
#DEFS += -DIPS_70
DEFS += -DIPS_101

# Define optimisation level here
OPT =

# Tools
PREFIX =
CC   = $(PREFIX)gcc
CXX  = $(PREFIX)g++
GDB  = $(PREFIX)gdb
CP   = $(PREFIX)objcopy
AS   = $(PREFIX)gcc -x assembler-with-cpp

# List of source files
SRC  = ./main/$(PROJECT).c
SRC += ./main/platform.c

SRC += ./riverdi-eve-lib/eve_layer/Gpu_Hal.c
SRC += ./riverdi-eve-lib/eve_layer/CoPro_Cmds.c
SRC += ./riverdi-eve-lib/eve_layer/Hal_Utils.c
SRC += ./riverdi-eve-lib/app_layer/App_Common.c

# List all include directories here
INCDIRS  = ./main
INCDIRS += ./riverdi-eve-lib/eve_layer
INCDIRS += ./riverdi-eve-lib/app_layer
INCDIRS += ./riverdi-eve-lib/riverdi_modules

# List the user directory to look for the libraries here
LIBDIRS +=

# List all user libraries here
LIBS =

# Dirs
OBJS    = $(SRC:.c=.o)
INCDIR  = $(patsubst %,-I%, $(INCDIRS))
LIBDIR  = $(patsubst %,-L%, $(LIBDIRS))
LIB     = $(patsubst %,-l%, $(LIBS))

# Flags
COMMONFLAGS =
ASFLAGS = $(COMMONFLAGS)
CPFLAGS = $(COMMONFLAGS) $(DEFS)
LDFLAGS = $(COMMONFLAGS) $(LIBDIR) $(LIB)

#
# Makefile Rules
#

all: $(PROJECT)

$(PROJECT): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) $(LIBS) -o $@

%.o: %.c
	$(CC) -c $(CPFLAGS) -I . $(INCDIR) $< -o $@

%.o: %.s
	$(AS) -c $(ASFLAGS) $< -o $@

clean:
	-rm -rf $(PROJECT)
	-rm -rf $(OBJS)
	-rm -rf $(SRC:.c=.lst)
	-rm -rf $(ASRC:.s=.lst)
