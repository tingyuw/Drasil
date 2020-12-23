/** \file DerivedValues.cs
    \author Ting-Yu Wu
    \brief Provides the function for calculating derived values
*/
using System;
using System.IO;

public class DerivedValues {
    
    /** \brief Calculates values that can be immediately derived from the inputs
        \param inParams structure holding the input values
        \param inParams.F_vect_1 external force (N)
        \param inParams.x_1 distance from joint A to joint D (m)
        \param inParams.x_2 distance from joint D to joint B (m)
    */
    public static void derived_values(InputParameters inParams, double inParams.F_vect_1, double inParams.x_1, double inParams.x_2) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function derived_values called with inputs: {");
        outfile.Write("  inParams = ");
        outfile.Write("Instance of InputParameters object");
        outfile.WriteLine(", ");
        outfile.Write("  inParams.F_vect_1 = ");
        outfile.Write(inParams.F_vect_1);
        outfile.WriteLine(", ");
        outfile.Write("  inParams.x_1 = ");
        outfile.Write(inParams.x_1);
        outfile.WriteLine(", ");
        outfile.Write("  inParams.x_2 = ");
        outfile.WriteLine(inParams.x_2);
        outfile.WriteLine("  }");
        outfile.Close();
        
        inParams.F_vect_Ax = 0;
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'inParams.F_vect_Ax' assigned ");
        outfile.Write(inParams.F_vect_Ax);
        outfile.WriteLine(" in module DerivedValues");
        outfile.Close();
        
        inParams.F_vect_Ay = inParams.F_vect_1 * inParams.x_2 / (inParams.x_1 + inParams.x_2);
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'inParams.F_vect_Ay' assigned ");
        outfile.Write(inParams.F_vect_Ay);
        outfile.WriteLine(" in module DerivedValues");
        outfile.Close();
        
        inParams.F_vect_By = inParams.F_vect_1 * inParams.x_1 / (inParams.x_1 + inParams.x_2);
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'inParams.F_vect_By' assigned ");
        outfile.Write(inParams.F_vect_By);
        outfile.WriteLine(" in module DerivedValues");
        outfile.Close();
        
        inParams.F_vect_CD = inParams.F_vect_1;
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'inParams.F_vect_CD' assigned ");
        outfile.Write(inParams.F_vect_CD);
        outfile.WriteLine(" in module DerivedValues");
        outfile.Close();
    }
}
