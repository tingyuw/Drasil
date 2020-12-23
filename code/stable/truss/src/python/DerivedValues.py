## \file DerivedValues.py
# \author Ting-Yu Wu
# \brief Provides the function for calculating derived values
## \brief Calculates values that can be immediately derived from the inputs
# \param inParams structure holding the input values
# \param inParams.F_vect_1 external force (N)
# \param inParams.x_1 distance from joint A to joint D (m)
# \param inParams.x_2 distance from joint D to joint B (m)
def derived_values(inParams, inParams.F_vect_1, inParams.x_1, inParams.x_2):
    outfile = open("log.txt", "a")
    print("function derived_values called with inputs: {", file=outfile)
    print("  inParams = ", end="", file=outfile)
    print("Instance of InputParameters object", end="", file=outfile)
    print(", ", file=outfile)
    print("  inParams.F_vect_1 = ", end="", file=outfile)
    print(inParams.F_vect_1, end="", file=outfile)
    print(", ", file=outfile)
    print("  inParams.x_1 = ", end="", file=outfile)
    print(inParams.x_1, end="", file=outfile)
    print(", ", file=outfile)
    print("  inParams.x_2 = ", end="", file=outfile)
    print(inParams.x_2, file=outfile)
    print("  }", file=outfile)
    outfile.close()
    
    inParams.F_vect_Ax = 0
    outfile = open("log.txt", "a")
    print("var 'inParams.F_vect_Ax' assigned ", end="", file=outfile)
    print(inParams.F_vect_Ax, end="", file=outfile)
    print(" in module DerivedValues", file=outfile)
    outfile.close()
    
    inParams.F_vect_Ay = inParams.F_vect_1 * inParams.x_2 / (inParams.x_1 + inParams.x_2)
    outfile = open("log.txt", "a")
    print("var 'inParams.F_vect_Ay' assigned ", end="", file=outfile)
    print(inParams.F_vect_Ay, end="", file=outfile)
    print(" in module DerivedValues", file=outfile)
    outfile.close()
    
    inParams.F_vect_By = inParams.F_vect_1 * inParams.x_1 / (inParams.x_1 + inParams.x_2)
    outfile = open("log.txt", "a")
    print("var 'inParams.F_vect_By' assigned ", end="", file=outfile)
    print(inParams.F_vect_By, end="", file=outfile)
    print(" in module DerivedValues", file=outfile)
    outfile.close()
    
    inParams.F_vect_CD = inParams.F_vect_1
    outfile = open("log.txt", "a")
    print("var 'inParams.F_vect_CD' assigned ", end="", file=outfile)
    print(inParams.F_vect_CD, end="", file=outfile)
    print(" in module DerivedValues", file=outfile)
    outfile.close()
