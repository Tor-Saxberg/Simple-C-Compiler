CXX		= g++
CXXFLAGS	= -g -Wall -Wno-c++0x-compat
EXTRAS		= lexer.cpp
OBJS		= Scope.o Symbol.o Tree.o Type.o allocator.o checker.o \
		  generator.o lexer.o parser.o
PROG		= scc


all:		$(PROG)



#gcc -g -m32 ../examples/matrix.s
#-./a.out < ../examples/matrix.in > ../examples/matrix.txt
#diff ../examples/matrix.txt ../examples/matrix.out


$(PROG):	$(EXTRAS) $(OBJS)
		$(CXX) -o $(PROG) $(OBJS)

clean:;		$(RM) $(PROG) core *.o

clobber:;	$(RM) $(EXTRAS) $(PROG) core *.o

lexer.cpp:	lexer.l
		$(LEX) $(LFLAGS) -t lexer.l > lexer.cpp
