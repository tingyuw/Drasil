#include "InputFormat.hpp"

#include <algorithm>
#include <fstream>
#include <iostream>
#include <limits>
#include <string>

#include "InputParameters.hpp"

using std::ifstream;
using std::ofstream;
using std::string;

void get_input(string filename, InputParameters &inParams) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function get_input called with inputs: {" << std::endl;
    outfile << "  filename = ";
    outfile << filename;
    outfile << ", " << std::endl;
    outfile << "  inParams = ";
    outfile << "Instance of InputParameters object" << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    ifstream infile;
    infile.open(filename, std::fstream::in);
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    infile >> inParams.F_vect_1;
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'inParams.F_vect_1' assigned ";
    outfile << inParams.F_vect_1;
    outfile << " in module InputFormat" << std::endl;
    outfile.close();
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    infile >> inParams.x_1;
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'inParams.x_1' assigned ";
    outfile << inParams.x_1;
    outfile << " in module InputFormat" << std::endl;
    outfile.close();
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    infile >> inParams.x_2;
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'inParams.x_2' assigned ";
    outfile << inParams.x_2;
    outfile << " in module InputFormat" << std::endl;
    outfile.close();
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    infile >> inParams.θ_1;
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'inParams.θ_1' assigned ";
    outfile << inParams.θ_1;
    outfile << " in module InputFormat" << std::endl;
    outfile.close();
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    infile >> inParams.θ_2;
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'inParams.θ_2' assigned ";
    outfile << inParams.θ_2;
    outfile << " in module InputFormat" << std::endl;
    outfile.close();
    infile.close();
}
