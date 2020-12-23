package Truss;

/** \file OutputFormat.java
    \author Ting-Yu Wu
    \brief Provides the function for writing outputs
*/
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class OutputFormat {
    
    /** \brief Writes the output values to output.txt
        \param inParams structure holding the input values
        \param F_vect_AC force between joint A and C (N)
        \param F_vect_AD force between joint A and D (N)
        \param F_vect_BC force between joint B and C (N)
        \param F_vect_BD force between joint B and D (N)
    */
    public static void write_output(InputParameters inParams, double F_vect_AC, double F_vect_AD, double F_vect_BC, double F_vect_BD) throws IOException {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function write_output called with inputs: {");
        outfile.print("  inParams = ");
        outfile.print("Instance of InputParameters object");
        outfile.println(", ");
        outfile.print("  F_vect_AC = ");
        outfile.print(F_vect_AC);
        outfile.println(", ");
        outfile.print("  F_vect_AD = ");
        outfile.print(F_vect_AD);
        outfile.println(", ");
        outfile.print("  F_vect_BC = ");
        outfile.print(F_vect_BC);
        outfile.println(", ");
        outfile.print("  F_vect_BD = ");
        outfile.println(F_vect_BD);
        outfile.println("  }");
        outfile.close();
        
        PrintWriter outputfile;
        outputfile = new PrintWriter(new FileWriter(new File("output.txt"), false));
        outputfile.print("F_vect_Ax = ");
        outputfile.println(inParams.F_vect_Ax);
        outputfile.print("F_vect_Ay = ");
        outputfile.println(inParams.F_vect_Ay);
        outputfile.print("F_vect_By = ");
        outputfile.println(inParams.F_vect_By);
        outputfile.print("F_vect_AC = ");
        outputfile.println(F_vect_AC);
        outputfile.print("F_vect_AD = ");
        outputfile.println(F_vect_AD);
        outputfile.print("F_vect_BC = ");
        outputfile.println(F_vect_BC);
        outputfile.print("F_vect_BD = ");
        outputfile.println(F_vect_BD);
        outputfile.print("F_vect_CD = ");
        outputfile.println(inParams.F_vect_CD);
        outputfile.close();
    }
}
