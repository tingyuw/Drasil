package Projectile;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class Control {
    
    public static void main(String[] args) throws Exception {
        PrintWriter outfile;
        String filename = args[0];
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'filename' assigned to ");
        outfile.print(filename);
        outfile.println(" in module Control");
        outfile.close();
        double v_launch;
        double theta;
        double p_target;
        double g_vect = 9.8;
        double epsilon = 2.0e-2;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'g_vect' assigned to ");
        outfile.print(g_vect);
        outfile.println(" in module Control");
        outfile.close();
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'epsilon' assigned to ");
        outfile.print(epsilon);
        outfile.println(" in module Control");
        outfile.close();
        Object[] outputs = InputFormat.get_input(filename);
        v_launch = (double)(outputs[0]);
        theta = (double)(outputs[1]);
        p_target = (double)(outputs[2]);
        InputConstraints.input_constraints(v_launch, theta, p_target);
        double t_flight = Calculations.func_t_flight(v_launch, theta, g_vect);
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 't_flight' assigned to ");
        outfile.print(t_flight);
        outfile.println(" in module Control");
        outfile.close();
        double p_land = Calculations.func_p_land(v_launch, theta, g_vect);
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'p_land' assigned to ");
        outfile.print(p_land);
        outfile.println(" in module Control");
        outfile.close();
        double d_offset = Calculations.func_d_offset(p_target, p_land);
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 'd_offset' assigned to ");
        outfile.print(d_offset);
        outfile.println(" in module Control");
        outfile.close();
        String s = Calculations.func_s(p_target, epsilon, d_offset);
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.print("var 's' assigned to ");
        outfile.print(s);
        outfile.println(" in module Control");
        outfile.close();
        OutputFormat.write_output(s, d_offset);
    }
}
