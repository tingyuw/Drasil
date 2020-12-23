## \file Calculations.py
# \author Ting-Yu Wu
# \brief Provides functions for calculating the outputs
import math

## \brief Calculates force between joint A and C (N)
# \param inParams structure holding the input values
# \return force between joint A and C (N)
def func_F_vect_AC(inParams):
    outfile = open("log.txt", "a")
    print("function func_F_vect_AC called with inputs: {", file=outfile)
    print("  inParams = ", end="", file=outfile)
    print("Instance of InputParameters object", file=outfile)
    print("  }", file=outfile)
    outfile.close()
    
    return -inParams.F_vect_Ay / math.sin(inParams.θ_1)

## \brief Calculates force between joint B and C (N)
# \param inParams structure holding the input values
# \return force between joint B and C (N)
def func_F_vect_BC(inParams):
    outfile = open("log.txt", "a")
    print("function func_F_vect_BC called with inputs: {", file=outfile)
    print("  inParams = ", end="", file=outfile)
    print("Instance of InputParameters object", file=outfile)
    print("  }", file=outfile)
    outfile.close()
    
    return -inParams.F_vect_By / math.sin(inParams.θ_2)

## \brief Calculates force between joint A and D (N)
# \param inParams structure holding the input values
# \param F_vect_AC force between joint A and C (N)
# \return force between joint A and D (N)
def func_F_vect_AD(inParams, F_vect_AC):
    outfile = open("log.txt", "a")
    print("function func_F_vect_AD called with inputs: {", file=outfile)
    print("  inParams = ", end="", file=outfile)
    print("Instance of InputParameters object", end="", file=outfile)
    print(", ", file=outfile)
    print("  F_vect_AC = ", end="", file=outfile)
    print(F_vect_AC, file=outfile)
    print("  }", file=outfile)
    outfile.close()
    
    return -F_vect_AC / math.cos(inParams.θ_1)

## \brief Calculates force between joint B and D (N)
# \param inParams structure holding the input values
# \param F_vect_BC force between joint B and C (N)
# \return force between joint B and D (N)
def func_F_vect_BD(inParams, F_vect_BC):
    outfile = open("log.txt", "a")
    print("function func_F_vect_BD called with inputs: {", file=outfile)
    print("  inParams = ", end="", file=outfile)
    print("Instance of InputParameters object", end="", file=outfile)
    print(", ", file=outfile)
    print("  F_vect_BC = ", end="", file=outfile)
    print(F_vect_BC, file=outfile)
    print("  }", file=outfile)
    outfile.close()
    
    return -F_vect_BC / math.cos(inParams.θ_2)
