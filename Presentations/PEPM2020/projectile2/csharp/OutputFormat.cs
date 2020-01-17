using System;
using System.IO;

public class OutputFormat {
    
    public static void write_output(string s, double d_offset) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function write_output called with inputs: {");
        outfile.Write("  s = ");
        outfile.Write(s);
        outfile.WriteLine(", ");
        outfile.Write("  d_offset = ");
        outfile.WriteLine(d_offset);
        outfile.WriteLine("  }");
        outfile.Close();
        
        StreamWriter outputfile;
        outputfile = new StreamWriter("output.txt", false);
        outputfile.Write("s = ");
        outputfile.WriteLine(s);
        outputfile.Write("d_offset = ");
        outputfile.WriteLine(d_offset);
        outputfile.Close();
    }
}
