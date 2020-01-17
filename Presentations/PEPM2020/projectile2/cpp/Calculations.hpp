#ifndef Calculations_h
#define Calculations_h

#include <string>

using std::ofstream;
using std::string;

double func_t_flight(double v_launch, double theta, double g_vect);

double func_p_land(double v_launch, double theta, double g_vect);

double func_d_offset(double p_target, double p_land);

string func_s(double p_target, double epsilon, double d_offset);

#endif
