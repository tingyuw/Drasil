#include <fstream>
#include <iostream>
#include <string>

#include "Calculations.hpp"
#include "InputConstraints.hpp"
#include "InputFormat.hpp"
#include "OutputFormat.hpp"

using std::ofstream;
using std::string;

int main(int argc, const char *argv[]) {
    ofstream outfile;
    string filename = argv[1];
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'filename' assigned to ";
    outfile << filename;
    outfile << " in module Control" << std::endl;
    outfile.close();
    double v_launch;
    double theta;
    double p_target;
    double g_vect = 9.8;
    double epsilon = 2.0e-2;
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'g_vect' assigned to ";
    outfile << g_vect;
    outfile << " in module Control" << std::endl;
    outfile.close();
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'epsilon' assigned to ";
    outfile << epsilon;
    outfile << " in module Control" << std::endl;
    outfile.close();
    get_input(filename, v_launch, theta, p_target);
    input_constraints(v_launch, theta, p_target);
    double t_flight = func_t_flight(v_launch, theta, g_vect);
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 't_flight' assigned to ";
    outfile << t_flight;
    outfile << " in module Control" << std::endl;
    outfile.close();
    double p_land = func_p_land(v_launch, theta, g_vect);
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'p_land' assigned to ";
    outfile << p_land;
    outfile << " in module Control" << std::endl;
    outfile.close();
    double d_offset = func_d_offset(p_target, p_land);
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 'd_offset' assigned to ";
    outfile << d_offset;
    outfile << " in module Control" << std::endl;
    outfile.close();
    string s = func_s(p_target, epsilon, d_offset);
    outfile.open("log.txt", std::fstream::app);
    outfile << "var 's' assigned to ";
    outfile << s;
    outfile << " in module Control" << std::endl;
    outfile.close();
    write_output(s, d_offset);
    
    return 0;
}
