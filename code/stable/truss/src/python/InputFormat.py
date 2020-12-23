## \file InputFormat.py
# \author Ting-Yu Wu
# \brief Provides the function for reading inputs
## \brief Reads input from a file with the given file name
# \param filename name of the input file
# \param inParams structure holding the input values
def get_input(filename, inParams):
    outfile = open("log.txt", "a")
    print("function get_input called with inputs: {", file=outfile)
    print("  filename = ", end="", file=outfile)
    print(filename, end="", file=outfile)
    print(", ", file=outfile)
    print("  inParams = ", end="", file=outfile)
    print("Instance of InputParameters object", file=outfile)
    print("  }", file=outfile)
    outfile.close()
    
    infile = open(filename, "r")
    infile.readline()
    inParams.F_vect_1 = float(infile.readline())
    outfile = open("log.txt", "a")
    print("var 'inParams.F_vect_1' assigned ", end="", file=outfile)
    print(inParams.F_vect_1, end="", file=outfile)
    print(" in module InputFormat", file=outfile)
    outfile.close()
    infile.readline()
    inParams.x_1 = float(infile.readline())
    outfile = open("log.txt", "a")
    print("var 'inParams.x_1' assigned ", end="", file=outfile)
    print(inParams.x_1, end="", file=outfile)
    print(" in module InputFormat", file=outfile)
    outfile.close()
    infile.readline()
    inParams.x_2 = float(infile.readline())
    outfile = open("log.txt", "a")
    print("var 'inParams.x_2' assigned ", end="", file=outfile)
    print(inParams.x_2, end="", file=outfile)
    print(" in module InputFormat", file=outfile)
    outfile.close()
    infile.readline()
    inParams.θ_1 = float(infile.readline())
    outfile = open("log.txt", "a")
    print("var 'inParams.θ_1' assigned ", end="", file=outfile)
    print(inParams.θ_1, end="", file=outfile)
    print(" in module InputFormat", file=outfile)
    outfile.close()
    infile.readline()
    inParams.θ_2 = float(infile.readline())
    outfile = open("log.txt", "a")
    print("var 'inParams.θ_2' assigned ", end="", file=outfile)
    print(inParams.θ_2, end="", file=outfile)
    print(" in module InputFormat", file=outfile)
    outfile.close()
    infile.close()
