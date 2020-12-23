#include "DerivedValues.hpp"

#include <fstream>
#include <iostream>
#include <string>

#include "InputParameters.hpp"

using std::ofstream;
using std::string;

void derived_values(InputParameters &inParams, double inParams.F_vect_1, double inParams.x_1, double inParams.x_2) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function derived_values called with inputs: {" << std::endl;
    outfile << "  inParams = ";
    outfile << "Instance of InputParameters object";
    outfile << ", " << std::endl;
    outfile << "  inParams.F_vect_1 = ";
    outfile << inParams.F_vect_1;
    outfile << ", " << std::endl;
    outfile << "  inParams.x_1 = ";
    outfile << inParams.x_1;
    outfile << ", " << std::endl;
    outfile << "  inParams.x_2 = ";
    outfile << inParams.x_2 << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    inParams.F_vect_Ax = 0;
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'inParams.F_vect_Ax' assigned ";
    outfile << inParams.F_vect_Ax;
    outfile << " in module DerivedValues" << std::endl;
    outfile.close();
    
    inParams.F_vect_Ay = inParams.F_vect_1 * inParams.x_2 / (inParams.x_1 + inParams.x_2);
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'inParams.F_vect_Ay' assigned ";
    outfile << inParams.F_vect_Ay;
    outfile << " in module DerivedValues" << std::endl;
    outfile.close();
    
    inParams.F_vect_By = inParams.F_vect_1 * inParams.x_1 / (inParams.x_1 + inParams.x_2);
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'inParams.F_vect_By' assigned ";
    outfile << inParams.F_vect_By;
    outfile << " in module DerivedValues" << std::endl;
    outfile.close();
    
    inParams.F_vect_CD = inParams.F_vect_1;
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'inParams.F_vect_CD' assigned ";
    outfile << inParams.F_vect_CD;
    outfile << " in module DerivedValues" << std::endl;
    outfile.close();
}
