/** \file InputConstraints.hpp
    \author Ting-Yu Wu
    \brief Provides the function for checking the physical constraints and software constraints on the input
*/
#ifndef InputConstraints_h
#define InputConstraints_h

#include <string>

#include "InputParameters.hpp"

using std::ofstream;
using std::string;

/** \brief Verifies that input values satisfy the physical constraints and software constraints
    \param inParams structure holding the input values
    \param pi ratio of circumference to diameter for any circle
*/
void input_constraints(InputParameters &inParams, double pi);

#endif
