using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;

namespace GlassBR_program {
    public class Calculations {
        
        public static double calc_B(double k, double a, double b, double m, double E, double h, double LDF, double J) {
            return (((k / (Math.Pow((a / 1000) * (b / 1000), m - 1))) * (Math.Pow((E * 1000) * (Math.Pow(h / 1000, 2)), m))) * LDF) * (Math.Exp(J));
        }
        
        public static double calc_h(double t) {
            if (t == 2.5) {
                return 2.16;
            }
            else if (t == 2.7) {
                return 2.59;
            }
            else if (t == 3.0) {
                return 2.92;
            }
            else if (t == 4.0) {
                return 3.78;
            }
            else if (t == 5.0) {
                return 4.57;
            }
            else if (t == 6.0) {
                return 5.56;
            }
            else if (t == 8.0) {
                return 7.42;
            }
            else if (t == 10.0) {
                return 9.02;
            }
            else if (t == 12.0) {
                return 11.91;
            }
            else if (t == 16.0) {
                return 15.09;
            }
            else if (t == 19.0) {
                return 18.26;
            }
            else if (t == 22.0) {
                return 21.44;
            }
        }
        
        public static double calc_LDF(double t_d, double m) {
            return Math.Pow(t_d / 60, m / 16);
        }
        
        public static double calc_J(double J, double q_hat, double a, double b) {
            return J(q_hat, a / b);
        }
        
        public static double calc_NFL(double q_hat_tol, double E, double h, double a, double b) {
            return ((q_hat_tol * E) * (Math.Pow(h, 4))) / (Math.Pow(a * b, 2));
        }
        
        public static double calc_GTF(double g) {
            if (g == "AN") {
                return 1;
            }
            else if (g == "FT") {
                return 4;
            }
            else if (g == "HS") {
                return 2;
            }
        }
        
        public static double calc_q_hat(double q, double a, double b, double E, double h, double GTF) {
            return (q * (Math.Pow(a * b, 2))) / ((E * (Math.Pow(h, 4))) * GTF);
        }
        
        public static double calc_q_hat_tol(double q_hat_tol, double J_tol, double a, double b) {
            return q_hat_tol(J_tol, a / b);
        }
        
        public static double calc_J_tol(double P_btol, double a, double b, double m, double k, double E, double h, double LDF) {
            return Math.Log((Math.Log(1 / (1 - P_btol))) * ((Math.Pow((a / 1000) * (b / 1000), m - 1)) / ((k * (Math.Pow((E * 1000) * (Math.Pow(h / 1000, 2)), m))) * LDF)));
        }
    }
}

