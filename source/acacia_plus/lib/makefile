# This file is part of Acacia+, a tool for synthesis of reactive systems using antichain-based techniques
# Copyright (C) 2011-2013 UMONS-ULB
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

OS = $(shell uname)
CC=gcc
ifeq ($(OS), Darwin)
	ARCHFLAG=
	TARGET=acacia_plus.dylib
endif
ifeq ($(OS), Linux)
	ARCHFLAG=
	TARGET=acacia_plus.so
endif
	
LFLAGS=`pkg-config --cflags --libs glib-2.0`
CFLAGS=$(LFLAGS) -fpic
EXEC=acacia_plus
OBJS=antichain.o backward_algorithm.o bits.o cache.o counting_function.o forward_algorithm.o hash_table.o linked_list.o memory_management.o transition_system.o safety_game.o synthesis.o tbucw.o tuple.o vector.o

acacia_plus.dylib: $(OBJS)
	$(CC) $(ARCHFLAG) -dynamiclib -o $@ $^ $(LFLAGS)
	
acacia_plus.so: $(OBJS)
	$(CC) $(ARCHFLAG) -shared -o $@ $^ $(LFLAGS)

antichain.o: linked_list.h

backward_algorithm.o: antichain.h bits.h cache.h linked_list.h safety_game.h tbucw.h tuple.h

cache.o: antichain.h hash_table.h tuple.h

counting_function.o: antichain.h bits.h linked_list.h tbucw.h 

forward_algorithm.o: antichain.h counting_function.h hash_table.h linked_list.h safety_game.h tbucw.h tuple.h  

hash_table.o: counting_function.h

transition_system.o: tbucw.h

safety_game_o: antichain.h counting_function.h tuple.h

synthesis.o: antichain.h transition_system.h safety_game.h tbucw.h tuple.h

tbucw.o: bits.h

tuple.o: counting_function.h vector.h

%.o: %.c
	$(CC) $(ARCHFLAG) -o $@ $(CFLAGS) -c $< 

clean:
	rm -f *.o
	
mrproper: clean
	rm -f *.dylib *.so
	
install: $(TARGET) clean	