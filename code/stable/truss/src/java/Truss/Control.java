package Truss;

/** \file Control.java
    \author Ting-Yu Wu
    \brief Controls the flow of the program
*/
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Control {
    
    /** \brief Controls the flow of the program
        \param args List of command-line arguments
    */
    public static void main(String[] args) throws Exception, FileNotFoundException, IOException {
        PrintWriter outfile;
        String filename = args[0];
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'filename' assigned ");
        outfile.print(filename);
        outfile.println(" in module Control");
        outfile.close();
        InputParameters inParams = new InputParameters();
        InputFormat.get_input(filename, inParams);
        DerivedValues.derived_values(inParams, inParams.F_vect_1, inParams.x_1, inParams.x_2);
        InputConstraints.input_constraints(inParams, pi);
        double F_vect_AC = Calculations.func_F_vect_AC(inParams);
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'F_vect_AC' assigned ");
        outfile.print(F_vect_AC);
        outfile.println(" in module Control");
        outfile.close();
        double F_vect_BC = Calculations.func_F_vect_BC(inParams);
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'F_vect_BC' assigned ");
        outfile.print(F_vect_BC);
        outfile.println(" in module Control");
        outfile.close();
        double F_vect_AD = Calculations.func_F_vect_AD(inParams, F_vect_AC);
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'F_vect_AD' assigned ");
        outfile.print(F_vect_AD);
        outfile.println(" in module Control");
        outfile.close();
        double F_vect_BD = Calculations.func_F_vect_BD(inParams, F_vect_BC);
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'F_vect_BD' assigned ");
        outfile.print(F_vect_BD);
        outfile.println(" in module Control");
        outfile.close();
        OutputFormat.write_output(inParams, F_vect_AC, F_vect_AD, F_vect_BC, F_vect_BD);
    }
}
