using System;
using System.IO;

public class InputFormat {
    
    public static void get_input(string filename, out double v_launch, out double theta, out double p_target) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function get_input called with inputs: {");
        outfile.Write("  filename = ");
        outfile.WriteLine(filename);
        outfile.WriteLine("  }");
        outfile.Close();
        
        StreamReader infile;
        infile = new StreamReader(filename);
        infile.ReadLine();
        v_launch = Double.Parse(infile.ReadLine());
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'v_launch' assigned to ");
        outfile.Write(v_launch);
        outfile.WriteLine(" in module InputFormat");
        outfile.Close();
        infile.ReadLine();
        theta = Double.Parse(infile.ReadLine());
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'theta' assigned to ");
        outfile.Write(theta);
        outfile.WriteLine(" in module InputFormat");
        outfile.Close();
        infile.ReadLine();
        p_target = Double.Parse(infile.ReadLine());
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'p_target' assigned to ");
        outfile.Write(p_target);
        outfile.WriteLine(" in module InputFormat");
        outfile.Close();
        infile.Close();
    }
}
