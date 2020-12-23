package Truss;

/** \file InputFormat.java
    \author Ting-Yu Wu
    \brief Provides the function for reading inputs
*/
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class InputFormat {
    
    /** \brief Reads input from a file with the given file name
        \param filename name of the input file
        \param inParams structure holding the input values
    */
    public static void get_input(String filename, InputParameters inParams) throws FileNotFoundException, IOException {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function get_input called with inputs: {");
        outfile.print("  filename = ");
        outfile.print(filename);
        outfile.println(", ");
        outfile.print("  inParams = ");
        outfile.println("Instance of InputParameters object");
        outfile.println("  }");
        outfile.close();
        
        Scanner infile;
        infile = new Scanner(new File(filename));
        infile.nextLine();
        inParams.F_vect_1 = Double.parseDouble(infile.nextLine());
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'inParams.F_vect_1' assigned ");
        outfile.print(inParams.F_vect_1);
        outfile.println(" in module InputFormat");
        outfile.close();
        infile.nextLine();
        inParams.x_1 = Double.parseDouble(infile.nextLine());
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'inParams.x_1' assigned ");
        outfile.print(inParams.x_1);
        outfile.println(" in module InputFormat");
        outfile.close();
        infile.nextLine();
        inParams.x_2 = Double.parseDouble(infile.nextLine());
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'inParams.x_2' assigned ");
        outfile.print(inParams.x_2);
        outfile.println(" in module InputFormat");
        outfile.close();
        infile.nextLine();
        inParams.θ_1 = Double.parseDouble(infile.nextLine());
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'inParams.θ_1' assigned ");
        outfile.print(inParams.θ_1);
        outfile.println(" in module InputFormat");
        outfile.close();
        infile.nextLine();
        inParams.θ_2 = Double.parseDouble(infile.nextLine());
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'inParams.θ_2' assigned ");
        outfile.print(inParams.θ_2);
        outfile.println(" in module InputFormat");
        outfile.close();
        infile.close();
    }
}
