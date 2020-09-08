APP = shading
CC=g++
CLEANBROKEN = '1'
# Add -pg for GNU profiling remove -g
LIBS = -Wall -g -std=c++11 -fpermissive -O4
SRC = shading.cpp
OBJ = $(SRC:.ccp=.o)

all: build

build: $(APP)

$(APP): $(OBJ)
	$(CC) $^ $(DEPS) $(LIBS) -o $@ 

%.o: %.cpp 
	$(CC) $< $(DEPS) $(LIBS) -c -o $@ 

clean:
	rm -rf $(APP) *.o
