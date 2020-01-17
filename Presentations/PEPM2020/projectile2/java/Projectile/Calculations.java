package Projectile;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class Calculations {
    
    public static double func_t_flight(double v_launch, double theta, double g_vect) throws Exception {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function func_t_flight called with inputs: {");
        outfile.print("  v_launch = ");
        outfile.print(v_launch);
        outfile.println(", ");
        outfile.print("  theta = ");
        outfile.print(theta);
        outfile.println(", ");
        outfile.print("  g_vect = ");
        outfile.println(g_vect);
        outfile.println("  }");
        outfile.close();
        
        return 2 * v_launch * Math.sin(theta) / g_vect;
    }
    
    public static double func_p_land(double v_launch, double theta, double g_vect) throws Exception {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function func_p_land called with inputs: {");
        outfile.print("  v_launch = ");
        outfile.print(v_launch);
        outfile.println(", ");
        outfile.print("  theta = ");
        outfile.print(theta);
        outfile.println(", ");
        outfile.print("  g_vect = ");
        outfile.println(g_vect);
        outfile.println("  }");
        outfile.close();
        
        return 2 * Math.pow(v_launch, 2) * Math.sin(theta) * Math.cos(theta) / g_vect;
    }
    
    public static double func_d_offset(double p_target, double p_land) throws Exception {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function func_d_offset called with inputs: {");
        outfile.print("  p_target = ");
        outfile.print(p_target);
        outfile.println(", ");
        outfile.print("  p_land = ");
        outfile.println(p_land);
        outfile.println("  }");
        outfile.close();
        
        return p_land - p_target;
    }
    
    public static String func_s(double p_target, double epsilon, double d_offset) throws Exception {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function func_s called with inputs: {");
        outfile.print("  p_target = ");
        outfile.print(p_target);
        outfile.println(", ");
        outfile.print("  epsilon = ");
        outfile.print(epsilon);
        outfile.println(", ");
        outfile.print("  d_offset = ");
        outfile.println(d_offset);
        outfile.println("  }");
        outfile.close();
        
        if (Math.abs(d_offset / p_target) < epsilon) {
            return "The target was hit.";
        }
        else if (d_offset < 0) {
            return "The projectile fell short.";
        }
        else {
            return "The projectile went long.";
        }
    }
}
