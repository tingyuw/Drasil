package Projectile;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class InputConstraints {
    
    public static void input_constraints(double v_launch, double theta, double p_target) throws Exception {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function input_constraints called with inputs: {");
        outfile.print("  v_launch = ");
        outfile.print(v_launch);
        outfile.println(", ");
        outfile.print("  theta = ");
        outfile.print(theta);
        outfile.println(", ");
        outfile.print("  p_target = ");
        outfile.println(p_target);
        outfile.println("  }");
        outfile.close();
        
        if (!(v_launch > 0)) {
            System.out.print("Warning: ");
            System.out.print("v_launch has value ");
            System.out.print(v_launch);
            System.out.print(" but suggested to be ");
            System.out.print("above ");
            System.out.print(0);
            System.out.println(".");
        }
        if (!(0 < theta && theta < Math.PI / 2)) {
            System.out.print("Warning: ");
            System.out.print("theta has value ");
            System.out.print(theta);
            System.out.print(" but suggested to be ");
            System.out.print("between ");
            System.out.print(0);
            System.out.print(" and ");
            System.out.print(Math.PI / 2);
            System.out.print(" ((pi)/(2))");
            System.out.println(".");
        }
        if (!(p_target > 0)) {
            System.out.print("Warning: ");
            System.out.print("p_target has value ");
            System.out.print(p_target);
            System.out.print(" but suggested to be ");
            System.out.print("above ");
            System.out.print(0);
            System.out.println(".");
        }
    }
}
