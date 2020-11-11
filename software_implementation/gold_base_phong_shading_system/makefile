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

build: check_out

check_out:	check_out.o
	$(CC) $^ $(DEPS) $(LIBS) -o $@ 

check_out.o:	output_quality_check.cpp
	$(CC) $< $(DEPS) $(LIBS) -c -o $@ 

build: input_file_formater

input_file_formater:	input_file_formater.o
	$(CC)	$^ $(DEPS) $(LIBS) -o $@

input_file_formater.o: input_file_formater.cpp
	$(CC)	$< $(DEPS) $(LIBS) -c -o $@

clean:
	rm -rf $(APP) check_out input_file_formater *.o
