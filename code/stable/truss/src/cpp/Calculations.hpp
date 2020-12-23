/** \file Calculations.hpp
    \author Ting-Yu Wu
    \brief Provides functions for calculating the outputs
*/
#ifndef Calculations_h
#define Calculations_h

#include <string>

#include "InputParameters.hpp"

using std::ofstream;
using std::string;

/** \brief Calculates force between joint A and C (N)
    \param inParams structure holding the input values
    \return force between joint A and C (N)
*/
double func_F_vect_AC(InputParameters &inParams);

/** \brief Calculates force between joint B and C (N)
    \param inParams structure holding the input values
    \return force between joint B and C (N)
*/
double func_F_vect_BC(InputParameters &inParams);

/** \brief Calculates force between joint A and D (N)
    \param inParams structure holding the input values
    \param F_vect_AC force between joint A and C (N)
    \return force between joint A and D (N)
*/
double func_F_vect_AD(InputParameters &inParams, double F_vect_AC);

/** \brief Calculates force between joint B and D (N)
    \param inParams structure holding the input values
    \param F_vect_BC force between joint B and C (N)
    \return force between joint B and D (N)
*/
double func_F_vect_BD(InputParameters &inParams, double F_vect_BC);

#endif
