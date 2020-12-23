/** \file InputFormat.cs
    \author Ting-Yu Wu
    \brief Provides the function for reading inputs
*/
using System;
using System.IO;

public class InputFormat {
    
    /** \brief Reads input from a file with the given file name
        \param filename name of the input file
        \param inParams structure holding the input values
    */
    public static void get_input(string filename, InputParameters inParams) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function get_input called with inputs: {");
        outfile.Write("  filename = ");
        outfile.Write(filename);
        outfile.WriteLine(", ");
        outfile.Write("  inParams = ");
        outfile.WriteLine("Instance of InputParameters object");
        outfile.WriteLine("  }");
        outfile.Close();
        
        StreamReader infile;
        infile = new StreamReader(filename);
        infile.ReadLine();
        inParams.F_vect_1 = Double.Parse(infile.ReadLine());
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'inParams.F_vect_1' assigned ");
        outfile.Write(inParams.F_vect_1);
        outfile.WriteLine(" in module InputFormat");
        outfile.Close();
        infile.ReadLine();
        inParams.x_1 = Double.Parse(infile.ReadLine());
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'inParams.x_1' assigned ");
        outfile.Write(inParams.x_1);
        outfile.WriteLine(" in module InputFormat");
        outfile.Close();
        infile.ReadLine();
        inParams.x_2 = Double.Parse(infile.ReadLine());
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'inParams.x_2' assigned ");
        outfile.Write(inParams.x_2);
        outfile.WriteLine(" in module InputFormat");
        outfile.Close();
        infile.ReadLine();
        inParams.θ_1 = Double.Parse(infile.ReadLine());
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'inParams.θ_1' assigned ");
        outfile.Write(inParams.θ_1);
        outfile.WriteLine(" in module InputFormat");
        outfile.Close();
        infile.ReadLine();
        inParams.θ_2 = Double.Parse(infile.ReadLine());
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'inParams.θ_2' assigned ");
        outfile.Write(inParams.θ_2);
        outfile.WriteLine(" in module InputFormat");
        outfile.Close();
        infile.Close();
    }
}
