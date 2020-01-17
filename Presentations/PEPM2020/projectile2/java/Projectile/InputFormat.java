package Projectile;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.Scanner;

public class InputFormat {
    
    public static Object[] get_input(String filename) throws Exception {
        double v_launch;
        double theta;
        double p_target;
        
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function get_input called with inputs: {");
        outfile.print("  filename = ");
        outfile.println(filename);
        outfile.println("  }");
        outfile.close();
        
        Scanner infile;
        infile = new Scanner(new File(filename));
        infile.nextLine();
        v_launch = Double.parseDouble(infile.nextLine());
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'v_launch' assigned to ");
        outfile.print(v_launch);
        outfile.println(" in module InputFormat");
        outfile.close();
        infile.nextLine();
        theta = Double.parseDouble(infile.nextLine());
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'theta' assigned to ");
        outfile.print(theta);
        outfile.println(" in module InputFormat");
        outfile.close();
        infile.nextLine();
        p_target = Double.parseDouble(infile.nextLine());
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'p_target' assigned to ");
        outfile.print(p_target);
        outfile.println(" in module InputFormat");
        outfile.close();
        infile.close();
        
        Object[] outputs = new Object[3];
        outputs[0] = v_launch;
        outputs[1] = theta;
        outputs[2] = p_target;
        return outputs;
    }
}
