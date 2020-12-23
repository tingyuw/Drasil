#include "Calculations.hpp"

#include <fstream>
#include <iostream>
#include <math.h>
#include <string>

#include "InputParameters.hpp"

using std::ofstream;
using std::string;

double func_F_vect_AC(InputParameters &inParams) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function func_F_vect_AC called with inputs: {" << std::endl;
    outfile << "  inParams = ";
    outfile << "Instance of InputParameters object" << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    return -inParams.F_vect_Ay / sin(inParams.θ_1);
}

double func_F_vect_BC(InputParameters &inParams) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function func_F_vect_BC called with inputs: {" << std::endl;
    outfile << "  inParams = ";
    outfile << "Instance of InputParameters object" << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    return -inParams.F_vect_By / sin(inParams.θ_2);
}

double func_F_vect_AD(InputParameters &inParams, double F_vect_AC) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function func_F_vect_AD called with inputs: {" << std::endl;
    outfile << "  inParams = ";
    outfile << "Instance of InputParameters object";
    outfile << ", " << std::endl;
    outfile << "  F_vect_AC = ";
    outfile << F_vect_AC << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    return -F_vect_AC / cos(inParams.θ_1);
}

double func_F_vect_BD(InputParameters &inParams, double F_vect_BC) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function func_F_vect_BD called with inputs: {" << std::endl;
    outfile << "  inParams = ";
    outfile << "Instance of InputParameters object";
    outfile << ", " << std::endl;
    outfile << "  F_vect_BC = ";
    outfile << F_vect_BC << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    return -F_vect_BC / cos(inParams.θ_2);
}
