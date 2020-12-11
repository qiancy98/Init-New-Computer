ifeq ($(origin Help), undefined)
Help = Help:\n
help:
	@echo "$(Help)"
endif

Help += \n**cpp.mk**\n	*	compile\n	*.t	run & show time\n	*.a	run & open the output\n	*.graph	compile & run (with \"matplotlibcpp.h\")\n	clean.cpp	Clean c++ compile files.\n

####################

Input = $(if $(wildcard $*.in),< $*.in)

#.PHONY:%.r %.o %.t %.T
%.t:%
	time -f "%e s  %M KB" ./$* $(Input)
#	Time, Memory.

%.T:%
	time -p ./$* $(Input)
#	-p:basic	-v:full

%.a:%
	./$* $(Input) > $*.out
	code $*.out

%:%.cpp
	g++ $< -o $* -Wall -Wextra -Wconversion

%.graph:%.cpp
	g++ $< -std=c++11 -I/usr/include/python2.7 -lpython2.7 && ./a.out
	rm a.out

clean.cpp:
	rm $(basename $(wildcard *.cpp))
