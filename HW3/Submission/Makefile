JFLAGS = -g

JC = javac -cp java-othello-src:.

.SUFFIXES: .java .class

.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = \
			 OthelloMove.java \
			 OthelloState.java \
			 OthelloPlayer.java \
			 Node.java \
			 OthelloRandomPlayer.java \
			 OthelloMiniMaxPlayer.java \
			 OthelloMonteCarloPlayer.java \
			 Test.java 

default: classes

classes: $(CLASSES:.java=.class)

clean: 
	$(RM) *.class
