import sys

import Calculations
import InputConstraints
import InputFormat
import OutputFormat

filename = sys.argv[1]
outfile = open("log.txt", "a")
print("var 'filename' assigned to ", end='', file=outfile)
print(filename, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
g_vect = 9.8
epsilon = 2.0e-2
outfile = open("log.txt", "a")
print("var 'g_vect' assigned to ", end='', file=outfile)
print(g_vect, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
outfile = open("log.txt", "a")
print("var 'epsilon' assigned to ", end='', file=outfile)
print(epsilon, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
v_launch, theta, p_target = InputFormat.get_input(filename)
InputConstraints.input_constraints(v_launch, theta, p_target)
t_flight = Calculations.func_t_flight(v_launch, theta, g_vect)
outfile = open("log.txt", "a")
print("var 't_flight' assigned to ", end='', file=outfile)
print(t_flight, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
p_land = Calculations.func_p_land(v_launch, theta, g_vect)
outfile = open("log.txt", "a")
print("var 'p_land' assigned to ", end='', file=outfile)
print(p_land, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
d_offset = Calculations.func_d_offset(p_target, p_land)
outfile = open("log.txt", "a")
print("var 'd_offset' assigned to ", end='', file=outfile)
print(d_offset, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
s = Calculations.func_s(p_target, epsilon, d_offset)
outfile = open("log.txt", "a")
print("var 's' assigned to ", end='', file=outfile)
print(s, end='', file=outfile)
print(" in module Control", file=outfile)
outfile.close()
OutputFormat.write_output(s, d_offset)
