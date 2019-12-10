## \file Control.py
# \author Nikitha Krithnan and W. Spencer Smith
# \brief Controls the flow of the program
import sys
import math

import InputParameters
import InputFormat
import DerivedValues
import InputConstraints
import OutputFormat
import Calculations

filename = sys.argv[1]
outfile = open("log.txt", "a")
print("var 'filename' assigned to ", end='', file=outfile)
print(filename, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
inParams = InputParameters.InputParameters()
InputFormat.get_input(inParams, filename)
DerivedValues.derived_values(inParams)
InputConstraints.input_constraints(inParams)
J_tol = Calculations.func_J_tol(inParams)
outfile = open("log.txt", "a")
print("var 'J_tol' assigned to ", end='', file=outfile)
print(J_tol, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
q = Calculations.func_q(inParams)
outfile = open("log.txt", "a")
print("var 'q' assigned to ", end='', file=outfile)
print(q, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
q_hat = Calculations.func_q_hat(inParams, q)
outfile = open("log.txt", "a")
print("var 'q_hat' assigned to ", end='', file=outfile)
print(q_hat, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
q_hat_tol = Calculations.func_q_hat_tol(inParams, J_tol)
outfile = open("log.txt", "a")
print("var 'q_hat_tol' assigned to ", end='', file=outfile)
print(q_hat_tol, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
J = Calculations.func_J(inParams, q_hat)
outfile = open("log.txt", "a")
print("var 'J' assigned to ", end='', file=outfile)
print(J, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
NFL = Calculations.func_NFL(inParams, q_hat_tol)
outfile = open("log.txt", "a")
print("var 'NFL' assigned to ", end='', file=outfile)
print(NFL, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
B = Calculations.func_B(inParams, J)
outfile = open("log.txt", "a")
print("var 'B' assigned to ", end='', file=outfile)
print(B, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
LR = Calculations.func_LR(inParams, NFL)
outfile = open("log.txt", "a")
print("var 'LR' assigned to ", end='', file=outfile)
print(LR, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
is_safeLR = Calculations.func_is_safeLR(LR, q)
outfile = open("log.txt", "a")
print("var 'is_safeLR' assigned to ", end='', file=outfile)
print(is_safeLR, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
P_b = Calculations.func_P_b(B)
outfile = open("log.txt", "a")
print("var 'P_b' assigned to ", end='', file=outfile)
print(P_b, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
is_safePb = Calculations.func_is_safePb(inParams, P_b)
outfile = open("log.txt", "a")
print("var 'is_safePb' assigned to ", end='', file=outfile)
print(is_safePb, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
OutputFormat.write_output(is_safePb, is_safeLR, P_b)
