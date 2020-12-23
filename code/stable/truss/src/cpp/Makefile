ifeq "$(OS)" "Windows_NT"
    TARGET_EXTENSION=.exe
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S), Linux)
        TARGET_EXTENSION=
    endif
    ifeq ($(UNAME_S), Darwin)
        TARGET_EXTENSION=
    endif
endif

build: Truss$(TARGET_EXTENSION)

Truss$(TARGET_EXTENSION): InputParameters.hpp InputFormat.hpp DerivedValues.hpp InputConstraints.hpp Calculations.hpp OutputFormat.hpp Control.cpp InputFormat.cpp DerivedValues.cpp InputConstraints.cpp Calculations.cpp OutputFormat.cpp
	"$(CXX)" Control.cpp InputFormat.cpp DerivedValues.cpp InputConstraints.cpp Calculations.cpp OutputFormat.cpp --std=c++11 -o Truss$(TARGET_EXTENSION)

run: build
	./Truss$(TARGET_EXTENSION) $(RUNARGS)

doc: doxConfig InputParameters.hpp InputFormat.hpp DerivedValues.hpp InputConstraints.hpp Calculations.hpp OutputFormat.hpp Control.cpp
	doxygen doxConfig

.PHONY: build run doc
