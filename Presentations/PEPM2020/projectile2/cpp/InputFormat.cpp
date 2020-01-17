#include "InputFormat.hpp"

#include <algorithm>
#include <fstream>
#include <iostream>
#include <limits>
#include <string>

using std::ifstream;
using std::ofstream;
using std::string;

void get_input(string filename, double &v_launch, double &theta, double &p_target) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function get_input called with inputs: {" << std::endl;
    outfile << "  filename = ";
    outfile << filename << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    ifstream infile;
    infile.open(filename, std::fstream::in);
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    infile >> v_launch;
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'v_launch' assigned to ";
    outfile << v_launch;
    outfile << " in module InputFormat" << std::endl;
    outfile.close();
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    infile >> theta;
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'theta' assigned to ";
    outfile << theta;
    outfile << " in module InputFormat" << std::endl;
    outfile.close();
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    infile >> p_target;
    infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'p_target' assigned to ";
    outfile << p_target;
    outfile << " in module InputFormat" << std::endl;
    outfile.close();
    infile.close();
}
