#include "InputConstraints.hpp"

#include <fstream>
#include <iostream>
#include <string>

#include "InputParameters.hpp"

using std::ofstream;
using std::string;

void input_constraints(InputParameters &inParams, double pi) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function input_constraints called with inputs: {" << std::endl;
    outfile << "  inParams = ";
    outfile << "Instance of InputParameters object";
    outfile << ", " << std::endl;
    outfile << "  pi = ";
    outfile << pi << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    if (!(-100000 <= inParams.F_vect_1 && inParams.F_vect_1 <= 100000)) {
        std::cout << "F_vect_1 has value ";
        std::cout << inParams.F_vect_1;
        std::cout << ", but is expected to be ";
        std::cout << "between ";
        std::cout << -100000;
        std::cout << " (F_vect_min)";
        std::cout << " and ";
        std::cout << 100000;
        std::cout << " (F_vect_max)";
        std::cout << "." << std::endl;
        throw("InputError");
    }
    if (!(0.0 < inParams.x_1 && inParams.x_1 <= 100000)) {
        std::cout << "x_1 has value ";
        std::cout << inParams.x_1;
        std::cout << ", but is expected to be ";
        std::cout << "between ";
        std::cout << 0.0;
        std::cout << " (d_min)";
        std::cout << " and ";
        std::cout << 100000;
        std::cout << " (d_max)";
        std::cout << "." << std::endl;
        throw("InputError");
    }
    if (!(0.0 < inParams.x_2 && inParams.x_2 <= 100000)) {
        std::cout << "x_2 has value ";
        std::cout << inParams.x_2;
        std::cout << ", but is expected to be ";
        std::cout << "between ";
        std::cout << 0.0;
        std::cout << " (d_min)";
        std::cout << " and ";
        std::cout << 100000;
        std::cout << " (d_max)";
        std::cout << "." << std::endl;
        throw("InputError");
    }
    if (!(pi / 2 < inParams.θ_1 && inParams.θ_1 < pi / 2)) {
        std::cout << "θ_1 has value ";
        std::cout << inParams.θ_1;
        std::cout << ", but is expected to be ";
        std::cout << "between ";
        std::cout << (pi / 2);
        std::cout << " (θ_min)";
        std::cout << " and ";
        std::cout << (pi / 2);
        std::cout << " (θ_max)";
        std::cout << "." << std::endl;
        throw("InputError");
    }
    if (!(pi / 2 < inParams.θ_2 && inParams.θ_2 < pi / 2)) {
        std::cout << "θ_2 has value ";
        std::cout << inParams.θ_2;
        std::cout << ", but is expected to be ";
        std::cout << "between ";
        std::cout << (pi / 2);
        std::cout << " (θ_min)";
        std::cout << " and ";
        std::cout << (pi / 2);
        std::cout << " (θ_max)";
        std::cout << "." << std::endl;
        throw("InputError");
    }
    
    if (!(inParams.F_vect_1 > 0)) {
        std::cout << "F_vect_1 has value ";
        std::cout << inParams.F_vect_1;
        std::cout << ", but is expected to be ";
        std::cout << "above ";
        std::cout << 0;
        std::cout << "." << std::endl;
        throw("InputError");
    }
    if (!(inParams.x_1 > 0)) {
        std::cout << "x_1 has value ";
        std::cout << inParams.x_1;
        std::cout << ", but is expected to be ";
        std::cout << "above ";
        std::cout << 0;
        std::cout << "." << std::endl;
        throw("InputError");
    }
    if (!(inParams.x_2 > 0)) {
        std::cout << "x_2 has value ";
        std::cout << inParams.x_2;
        std::cout << ", but is expected to be ";
        std::cout << "above ";
        std::cout << 0;
        std::cout << "." << std::endl;
        throw("InputError");
    }
    if (!(0 < inParams.θ_1 && inParams.θ_1 < pi)) {
        std::cout << "θ_1 has value ";
        std::cout << inParams.θ_1;
        std::cout << ", but is expected to be ";
        std::cout << "between ";
        std::cout << 0;
        std::cout << " and ";
        std::cout << pi;
        std::cout << " (pi)";
        std::cout << "." << std::endl;
        throw("InputError");
    }
    if (!(0 < inParams.θ_2 && inParams.θ_2 < pi)) {
        std::cout << "θ_2 has value ";
        std::cout << inParams.θ_2;
        std::cout << ", but is expected to be ";
        std::cout << "between ";
        std::cout << 0;
        std::cout << " and ";
        std::cout << pi;
        std::cout << " (pi)";
        std::cout << "." << std::endl;
        throw("InputError");
    }
}
