/** \file DerivedValues.hpp
    \author Ting-Yu Wu
    \brief Provides the function for calculating derived values
*/
#ifndef DerivedValues_h
#define DerivedValues_h

#include <string>

#include "InputParameters.hpp"

using std::ofstream;
using std::string;

/** \brief Calculates values that can be immediately derived from the inputs
    \param inParams structure holding the input values
    \param inParams.F_vect_1 external force (N)
    \param inParams.x_1 distance from joint A to joint D (m)
    \param inParams.x_2 distance from joint D to joint B (m)
*/
void derived_values(InputParameters &inParams, double inParams.F_vect_1, double inParams.x_1, double inParams.x_2);

#endif
