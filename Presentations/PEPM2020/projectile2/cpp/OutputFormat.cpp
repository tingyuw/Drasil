#include "OutputFormat.hpp"

#include <fstream>
#include <iostream>
#include <string>

using std::ofstream;
using std::string;

void write_output(string s, double d_offset) {
    ofstream outfile;
    outfile.open("log.txt", std::fstream::app);
    outfile << "function write_output called with inputs: {" << std::endl;
    outfile << "  s = ";
    outfile << s;
    outfile << ", " << std::endl;
    outfile << "  d_offset = ";
    outfile << d_offset << std::endl;
    outfile << "  }" << std::endl;
    outfile.close();
    
    ofstream outputfile;
    outputfile.open("output.txt", std::fstream::out);
    outputfile << "s = ";
    outputfile << s << std::endl;
    outputfile << "d_offset = ";
    outputfile << d_offset << std::endl;
    outputfile.close();
}
