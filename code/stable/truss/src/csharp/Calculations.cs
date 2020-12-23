/** \file Calculations.cs
    \author Ting-Yu Wu
    \brief Provides functions for calculating the outputs
*/
using System;
using System.IO;

public class Calculations {
    
    /** \brief Calculates force between joint A and C (N)
        \param inParams structure holding the input values
        \return force between joint A and C (N)
    */
    public static double func_F_vect_AC(InputParameters inParams) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function func_F_vect_AC called with inputs: {");
        outfile.Write("  inParams = ");
        outfile.WriteLine("Instance of InputParameters object");
        outfile.WriteLine("  }");
        outfile.Close();
        
        return -inParams.F_vect_Ay / Math.Sin(inParams.θ_1);
    }
    
    /** \brief Calculates force between joint B and C (N)
        \param inParams structure holding the input values
        \return force between joint B and C (N)
    */
    public static double func_F_vect_BC(InputParameters inParams) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function func_F_vect_BC called with inputs: {");
        outfile.Write("  inParams = ");
        outfile.WriteLine("Instance of InputParameters object");
        outfile.WriteLine("  }");
        outfile.Close();
        
        return -inParams.F_vect_By / Math.Sin(inParams.θ_2);
    }
    
    /** \brief Calculates force between joint A and D (N)
        \param inParams structure holding the input values
        \param F_vect_AC force between joint A and C (N)
        \return force between joint A and D (N)
    */
    public static double func_F_vect_AD(InputParameters inParams, double F_vect_AC) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function func_F_vect_AD called with inputs: {");
        outfile.Write("  inParams = ");
        outfile.Write("Instance of InputParameters object");
        outfile.WriteLine(", ");
        outfile.Write("  F_vect_AC = ");
        outfile.WriteLine(F_vect_AC);
        outfile.WriteLine("  }");
        outfile.Close();
        
        return -F_vect_AC / Math.Cos(inParams.θ_1);
    }
    
    /** \brief Calculates force between joint B and D (N)
        \param inParams structure holding the input values
        \param F_vect_BC force between joint B and C (N)
        \return force between joint B and D (N)
    */
    public static double func_F_vect_BD(InputParameters inParams, double F_vect_BC) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function func_F_vect_BD called with inputs: {");
        outfile.Write("  inParams = ");
        outfile.Write("Instance of InputParameters object");
        outfile.WriteLine(", ");
        outfile.Write("  F_vect_BC = ");
        outfile.WriteLine(F_vect_BC);
        outfile.WriteLine("  }");
        outfile.Close();
        
        return -F_vect_BC / Math.Cos(inParams.θ_2);
    }
}
