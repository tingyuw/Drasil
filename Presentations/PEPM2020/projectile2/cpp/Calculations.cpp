#include "Calculations.hpp"

#include <fstream>
#include <iostream>
#include <math.h>
#include <string>

using std::ofstream;
using std::string;

double func_t_flight(double v_launch, double theta, double g_vect) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function func_t_flight called with inputs: {" << std::endl;
    outfile << "  v_launch = ";
    outfile << v_launch;
    outfile << ", " << std::endl;
    outfile << "  theta = ";
    outfile << theta;
    outfile << ", " << std::endl;
    outfile << "  g_vect = ";
    outfile << g_vect << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    return 2 * v_launch * sin(theta) / g_vect;
}

double func_p_land(double v_launch, double theta, double g_vect) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function func_p_land called with inputs: {" << std::endl;
    outfile << "  v_launch = ";
    outfile << v_launch;
    outfile << ", " << std::endl;
    outfile << "  theta = ";
    outfile << theta;
    outfile << ", " << std::endl;
    outfile << "  g_vect = ";
    outfile << g_vect << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    return 2 * pow(v_launch, 2) * sin(theta) * cos(theta) / g_vect;
}

double func_d_offset(double p_target, double p_land) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function func_d_offset called with inputs: {" << std::endl;
    outfile << "  p_target = ";
    outfile << p_target;
    outfile << ", " << std::endl;
    outfile << "  p_land = ";
    outfile << p_land << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    return p_land - p_target;
}

string func_s(double p_target, double epsilon, double d_offset) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function func_s called with inputs: {" << std::endl;
    outfile << "  p_target = ";
    outfile << p_target;
    outfile << ", " << std::endl;
    outfile << "  epsilon = ";
    outfile << epsilon;
    outfile << ", " << std::endl;
    outfile << "  d_offset = ";
    outfile << d_offset << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    if (fabs(d_offset / p_target) < epsilon) {
        return "The target was hit.";
    }
    else if (d_offset < 0) {
        return "The projectile fell short.";
    }
    else {
        return "The projectile went long.";
    }
}
