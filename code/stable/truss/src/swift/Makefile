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

Truss$(TARGET_EXTENSION): main.swift InputParameters.swift InputFormat.swift DerivedValues.swift InputConstraints.swift Calculations.swift OutputFormat.swift
	swiftc main.swift InputParameters.swift InputFormat.swift DerivedValues.swift InputConstraints.swift Calculations.swift OutputFormat.swift -o Truss$(TARGET_EXTENSION)

run: build
	./Truss$(TARGET_EXTENSION) $(RUNARGS)

doc: main.swift InputParameters.swift InputFormat.swift DerivedValues.swift InputConstraints.swift Calculations.swift OutputFormat.swift

.PHONY: build run doc
