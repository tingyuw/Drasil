package Truss;

/** \file Calculations.java
    \author Ting-Yu Wu
    \brief Provides functions for calculating the outputs
*/
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Calculations {
    
    /** \brief Calculates force between joint A and C (N)
        \param inParams structure holding the input values
        \return force between joint A and C (N)
    */
    public static double func_F_vect_AC(InputParameters inParams) throws IOException {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function func_F_vect_AC called with inputs: {");
        outfile.print("  inParams = ");
        outfile.println("Instance of InputParameters object");
        outfile.println("  }");
        outfile.close();
        
        return -inParams.F_vect_Ay / Math.sin(inParams.θ_1);
    }
    
    /** \brief Calculates force between joint B and C (N)
        \param inParams structure holding the input values
        \return force between joint B and C (N)
    */
    public static double func_F_vect_BC(InputParameters inParams) throws IOException {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function func_F_vect_BC called with inputs: {");
        outfile.print("  inParams = ");
        outfile.println("Instance of InputParameters object");
        outfile.println("  }");
        outfile.close();
        
        return -inParams.F_vect_By / Math.sin(inParams.θ_2);
    }
    
    /** \brief Calculates force between joint A and D (N)
        \param inParams structure holding the input values
        \param F_vect_AC force between joint A and C (N)
        \return force between joint A and D (N)
    */
    public static double func_F_vect_AD(InputParameters inParams, double F_vect_AC) throws IOException {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function func_F_vect_AD called with inputs: {");
        outfile.print("  inParams = ");
        outfile.print("Instance of InputParameters object");
        outfile.println(", ");
        outfile.print("  F_vect_AC = ");
        outfile.println(F_vect_AC);
        outfile.println("  }");
        outfile.close();
        
        return -F_vect_AC / Math.cos(inParams.θ_1);
    }
    
    /** \brief Calculates force between joint B and D (N)
        \param inParams structure holding the input values
        \param F_vect_BC force between joint B and C (N)
        \return force between joint B and D (N)
    */
    public static double func_F_vect_BD(InputParameters inParams, double F_vect_BC) throws IOException {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function func_F_vect_BD called with inputs: {");
        outfile.print("  inParams = ");
        outfile.print("Instance of InputParameters object");
        outfile.println(", ");
        outfile.print("  F_vect_BC = ");
        outfile.println(F_vect_BC);
        outfile.println("  }");
        outfile.close();
        
        return -F_vect_BC / Math.cos(inParams.θ_2);
    }
}
