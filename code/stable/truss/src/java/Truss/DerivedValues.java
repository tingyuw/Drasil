package Truss;

/** \file DerivedValues.java
    \author Ting-Yu Wu
    \brief Provides the function for calculating derived values
*/
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class DerivedValues {
    
    /** \brief Calculates values that can be immediately derived from the inputs
        \param inParams structure holding the input values
        \param inParams.F_vect_1 external force (N)
        \param inParams.x_1 distance from joint A to joint D (m)
        \param inParams.x_2 distance from joint D to joint B (m)
    */
    public static void derived_values(InputParameters inParams, double inParams.F_vect_1, double inParams.x_1, double inParams.x_2) throws IOException {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function derived_values called with inputs: {");
        outfile.print("  inParams = ");
        outfile.print("Instance of InputParameters object");
        outfile.println(", ");
        outfile.print("  inParams.F_vect_1 = ");
        outfile.print(inParams.F_vect_1);
        outfile.println(", ");
        outfile.print("  inParams.x_1 = ");
        outfile.print(inParams.x_1);
        outfile.println(", ");
        outfile.print("  inParams.x_2 = ");
        outfile.println(inParams.x_2);
        outfile.println("  }");
        outfile.close();
        
        inParams.F_vect_Ax = 0;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'inParams.F_vect_Ax' assigned ");
        outfile.print(inParams.F_vect_Ax);
        outfile.println(" in module DerivedValues");
        outfile.close();
        
        inParams.F_vect_Ay = inParams.F_vect_1 * inParams.x_2 / (inParams.x_1 + inParams.x_2);
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'inParams.F_vect_Ay' assigned ");
        outfile.print(inParams.F_vect_Ay);
        outfile.println(" in module DerivedValues");
        outfile.close();
        
        inParams.F_vect_By = inParams.F_vect_1 * inParams.x_1 / (inParams.x_1 + inParams.x_2);
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'inParams.F_vect_By' assigned ");
        outfile.print(inParams.F_vect_By);
        outfile.println(" in module DerivedValues");
        outfile.close();
        
        inParams.F_vect_CD = inParams.F_vect_1;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'inParams.F_vect_CD' assigned ");
        outfile.print(inParams.F_vect_CD);
        outfile.println(" in module DerivedValues");
        outfile.close();
    }
}
