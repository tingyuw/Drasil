/** \file OutputFormat.cs
    \author Ting-Yu Wu
    \brief Provides the function for writing outputs
*/
using System;
using System.IO;

public class OutputFormat {
    
    /** \brief Writes the output values to output.txt
        \param inParams structure holding the input values
        \param F_vect_AC force between joint A and C (N)
        \param F_vect_AD force between joint A and D (N)
        \param F_vect_BC force between joint B and C (N)
        \param F_vect_BD force between joint B and D (N)
    */
    public static void write_output(InputParameters inParams, double F_vect_AC, double F_vect_AD, double F_vect_BC, double F_vect_BD) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function write_output called with inputs: {");
        outfile.Write("  inParams = ");
        outfile.Write("Instance of InputParameters object");
        outfile.WriteLine(", ");
        outfile.Write("  F_vect_AC = ");
        outfile.Write(F_vect_AC);
        outfile.WriteLine(", ");
        outfile.Write("  F_vect_AD = ");
        outfile.Write(F_vect_AD);
        outfile.WriteLine(", ");
        outfile.Write("  F_vect_BC = ");
        outfile.Write(F_vect_BC);
        outfile.WriteLine(", ");
        outfile.Write("  F_vect_BD = ");
        outfile.WriteLine(F_vect_BD);
        outfile.WriteLine("  }");
        outfile.Close();
        
        StreamWriter outputfile;
        outputfile = new StreamWriter("output.txt", false);
        outputfile.Write("F_vect_Ax = ");
        outputfile.WriteLine(inParams.F_vect_Ax);
        outputfile.Write("F_vect_Ay = ");
        outputfile.WriteLine(inParams.F_vect_Ay);
        outputfile.Write("F_vect_By = ");
        outputfile.WriteLine(inParams.F_vect_By);
        outputfile.Write("F_vect_AC = ");
        outputfile.WriteLine(F_vect_AC);
        outputfile.Write("F_vect_AD = ");
        outputfile.WriteLine(F_vect_AD);
        outputfile.Write("F_vect_BC = ");
        outputfile.WriteLine(F_vect_BC);
        outputfile.Write("F_vect_BD = ");
        outputfile.WriteLine(F_vect_BD);
        outputfile.Write("F_vect_CD = ");
        outputfile.WriteLine(inParams.F_vect_CD);
        outputfile.Close();
    }
}
