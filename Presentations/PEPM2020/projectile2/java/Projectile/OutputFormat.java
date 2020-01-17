package Projectile;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class OutputFormat {
    
    public static void write_output(String s, double d_offset) throws Exception {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function write_output called with inputs: {");
        outfile.print("  s = ");
        outfile.print(s);
        outfile.println(", ");
        outfile.print("  d_offset = ");
        outfile.println(d_offset);
        outfile.println("  }");
        outfile.close();
        
        PrintWriter outputfile;
        outputfile = new PrintWriter(new FileWriter(new File("output.txt"), false));
        outputfile.print("s = ");
        outputfile.println(s);
        outputfile.print("d_offset = ");
        outputfile.println(d_offset);
        outputfile.close();
    }
}
