analyser: lex.yy.o parser.tab.o
	gcc -o simple $^

parser.tab.h: parser.y
	bison --debug --verbose -d parser.y

parser.tab.c: parser.y
	bison -d parser.y

lex.yy.c: analyser.flex parser.tab.h
	flex  analyser.flex