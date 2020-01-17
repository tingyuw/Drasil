#include "InputConstraints.hpp"

#define _USE_MATH_DEFINES

#include <fstream>
#include <iostream>
#include <math.h>
#include <string>

using std::ofstream;
using std::string;

void input_constraints(double v_launch, double theta, double p_target) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function input_constraints called with inputs: {" << std::endl;
    outfile << "  v_launch = ";
    outfile << v_launch;
    outfile << ", " << std::endl;
    outfile << "  theta = ";
    outfile << theta;
    outfile << ", " << std::endl;
    outfile << "  p_target = ";
    outfile << p_target << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    if (!(v_launch > 0)) {
        std::cout << "Warning: ";
        std::cout << "v_launch has value ";
        std::cout << v_launch;
        std::cout << " but suggested to be ";
        std::cout << "above ";
        std::cout << 0;
        std::cout << "." << std::endl;
    }
    if (!(0 < theta && theta < M_PI / 2)) {
        std::cout << "Warning: ";
        std::cout << "theta has value ";
        std::cout << theta;
        std::cout << " but suggested to be ";
        std::cout << "between ";
        std::cout << 0;
        std::cout << " and ";
        std::cout << (M_PI / 2);
        std::cout << " ((pi)/(2))";
        std::cout << "." << std::endl;
    }
    if (!(p_target > 0)) {
        std::cout << "Warning: ";
        std::cout << "p_target has value ";
        std::cout << p_target;
        std::cout << " but suggested to be ";
        std::cout << "above ";
        std::cout << 0;
        std::cout << "." << std::endl;
    }
}
