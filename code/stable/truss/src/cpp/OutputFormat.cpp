#include "OutputFormat.hpp"

#include <fstream>
#include <iostream>
#include <string>

#include "InputParameters.hpp"

using std::ofstream;
using std::string;

void write_output(InputParameters &inParams, double F_vect_AC, double F_vect_AD, double F_vect_BC, double F_vect_BD) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function write_output called with inputs: {" << std::endl;
    outfile << "  inParams = ";
    outfile << "Instance of InputParameters object";
    outfile << ", " << std::endl;
    outfile << "  F_vect_AC = ";
    outfile << F_vect_AC;
    outfile << ", " << std::endl;
    outfile << "  F_vect_AD = ";
    outfile << F_vect_AD;
    outfile << ", " << std::endl;
    outfile << "  F_vect_BC = ";
    outfile << F_vect_BC;
    outfile << ", " << std::endl;
    outfile << "  F_vect_BD = ";
    outfile << F_vect_BD << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    ofstream outputfile;
    outputfile.open("output.txt", std::fstream::out);
    outputfile << "F_vect_Ax = ";
    outputfile << inParams.F_vect_Ax << std::endl;
    outputfile << "F_vect_Ay = ";
    outputfile << inParams.F_vect_Ay << std::endl;
    outputfile << "F_vect_By = ";
    outputfile << inParams.F_vect_By << std::endl;
    outputfile << "F_vect_AC = ";
    outputfile << F_vect_AC << std::endl;
    outputfile << "F_vect_AD = ";
    outputfile << F_vect_AD << std::endl;
    outputfile << "F_vect_BC = ";
    outputfile << F_vect_BC << std::endl;
    outputfile << "F_vect_BD = ";
    outputfile << F_vect_BD << std::endl;
    outputfile << "F_vect_CD = ";
    outputfile << inParams.F_vect_CD << std::endl;
    outputfile.close();
}
