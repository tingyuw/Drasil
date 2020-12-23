build: Truss/Control.class

Truss/Control.class: Truss/Control.java Truss/InputParameters.java Truss/InputFormat.java Truss/DerivedValues.java Truss/InputConstraints.java Truss/Calculations.java Truss/OutputFormat.java
	javac Truss/Control.java

run: build
	java Truss.Control $(RUNARGS)

doc: doxConfig Truss/Control.java Truss/InputParameters.java Truss/InputFormat.java Truss/DerivedValues.java Truss/InputConstraints.java Truss/Calculations.java Truss/OutputFormat.java
	doxygen doxConfig

.PHONY: build run doc
