/** \file Control.cs
    \author Ting-Yu Wu
    \brief Controls the flow of the program
*/
using System;
using System.IO;

public class Control {
    
    /** \brief Controls the flow of the program
        \param args List of command-line arguments
    */
    public static void Main(string[] args) {
        StreamWriter outfile;
        string filename = args[0];
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'filename' assigned ");
        outfile.Write(filename);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        InputParameters inParams = new InputParameters();
        InputFormat.get_input(filename, inParams);
        DerivedValues.derived_values(inParams, inParams.F_vect_1, inParams.x_1, inParams.x_2);
        InputConstraints.input_constraints(inParams, pi);
        double F_vect_AC = Calculations.func_F_vect_AC(inParams);
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'F_vect_AC' assigned ");
        outfile.Write(F_vect_AC);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        double F_vect_BC = Calculations.func_F_vect_BC(inParams);
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'F_vect_BC' assigned ");
        outfile.Write(F_vect_BC);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        double F_vect_AD = Calculations.func_F_vect_AD(inParams, F_vect_AC);
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'F_vect_AD' assigned ");
        outfile.Write(F_vect_AD);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        double F_vect_BD = Calculations.func_F_vect_BD(inParams, F_vect_BC);
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'F_vect_BD' assigned ");
        outfile.Write(F_vect_BD);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        OutputFormat.write_output(inParams, F_vect_AC, F_vect_AD, F_vect_BC, F_vect_BD);
    }
}
