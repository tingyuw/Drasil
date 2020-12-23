/** \file Control.cpp
    \author Ting-Yu Wu
    \brief Controls the flow of the program
*/
#include <fstream>
#include <iostream>
#include <string>

#include "Calculations.hpp"
#include "DerivedValues.hpp"
#include "InputConstraints.hpp"
#include "InputFormat.hpp"
#include "InputParameters.hpp"
#include "OutputFormat.hpp"

using std::ofstream;
using std::string;

/** \brief Controls the flow of the program
    \param argc Number of command-line arguments
    \param argv List of command-line arguments
    \return exit code
*/
int main(int argc, const char *argv[]) {
    ofstream outfile;
    string filename = argv[1];
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'filename' assigned ";
    outfile << filename;
    outfile << " in module Control" << std::endl;
    outfile.close();
    InputParameters inParams = InputParameters();
    get_input(filename, inParams);
    derived_values(inParams, inParams.F_vect_1, inParams.x_1, inParams.x_2);
    input_constraints(inParams, pi);
    double F_vect_AC = func_F_vect_AC(inParams);
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'F_vect_AC' assigned ";
    outfile << F_vect_AC;
    outfile << " in module Control" << std::endl;
    outfile.close();
    double F_vect_BC = func_F_vect_BC(inParams);
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'F_vect_BC' assigned ";
    outfile << F_vect_BC;
    outfile << " in module Control" << std::endl;
    outfile.close();
    double F_vect_AD = func_F_vect_AD(inParams, F_vect_AC);
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'F_vect_AD' assigned ";
    outfile << F_vect_AD;
    outfile << " in module Control" << std::endl;
    outfile.close();
    double F_vect_BD = func_F_vect_BD(inParams, F_vect_BC);
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'F_vect_BD' assigned ";
    outfile << F_vect_BD;
    outfile << " in module Control" << std::endl;
    outfile.close();
    write_output(inParams, F_vect_AC, F_vect_AD, F_vect_BC, F_vect_BD);
    
    return 0;
}
