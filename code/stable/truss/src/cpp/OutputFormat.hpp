/** \file OutputFormat.hpp
    \author Ting-Yu Wu
    \brief Provides the function for writing outputs
*/
#ifndef OutputFormat_h
#define OutputFormat_h

#include <string>

#include "InputParameters.hpp"

using std::ofstream;
using std::string;

/** \brief Writes the output values to output.txt
    \param inParams structure holding the input values
    \param F_vect_AC force between joint A and C (N)
    \param F_vect_AD force between joint A and D (N)
    \param F_vect_BC force between joint B and C (N)
    \param F_vect_BD force between joint B and D (N)
*/
void write_output(InputParameters &inParams, double F_vect_AC, double F_vect_AD, double F_vect_BC, double F_vect_BD);

#endif
