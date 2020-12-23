## \file Control.py
# \author Ting-Yu Wu
# \brief Controls the flow of the program
import sys

import Calculations
import DerivedValues
import InputConstraints
import InputFormat
import InputParameters
import OutputFormat

filename = sys.argv[1]
outfile = open("log.txt", "a")
print("var 'filename' assigned ", end="", file=outfile)
print(filename, end="", file=outfile)
print(" in module Control", file=outfile)
outfile.close()
inParams = InputParameters.InputParameters()
InputFormat.get_input(filename, inParams)
DerivedValues.derived_values(inParams, inParams.F_vect_1, inParams.x_1, inParams.x_2)
InputConstraints.input_constraints(inParams, pi)
F_vect_AC = Calculations.func_F_vect_AC(inParams)
outfile = open("log.txt", "a")
print("var 'F_vect_AC' assigned ", end="", file=outfile)
print(F_vect_AC, end="", file=outfile)
print(" in module Control", file=outfile)
outfile.close()
F_vect_BC = Calculations.func_F_vect_BC(inParams)
outfile = open("log.txt", "a")
print("var 'F_vect_BC' assigned ", end="", file=outfile)
print(F_vect_BC, end="", file=outfile)
print(" in module Control", file=outfile)
outfile.close()
F_vect_AD = Calculations.func_F_vect_AD(inParams, F_vect_AC)
outfile = open("log.txt", "a")
print("var 'F_vect_AD' assigned ", end="", file=outfile)
print(F_vect_AD, end="", file=outfile)
print(" in module Control", file=outfile)
outfile.close()
F_vect_BD = Calculations.func_F_vect_BD(inParams, F_vect_BC)
outfile = open("log.txt", "a")
print("var 'F_vect_BD' assigned ", end="", file=outfile)
print(F_vect_BD, end="", file=outfile)
print(" in module Control", file=outfile)
outfile.close()
OutputFormat.write_output(inParams, F_vect_AC, F_vect_AD, F_vect_BC, F_vect_BD)
