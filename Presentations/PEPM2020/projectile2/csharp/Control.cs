using System;
using System.IO;

public class Control {
    
    public static void Main(string[] args) {
        StreamWriter outfile;
        string filename = args[0];
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'filename' assigned to ");
        outfile.Write(filename);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        double v_launch;
        double theta;
        double p_target;
        double g_vect = 9.8;
        double epsilon = 2.0e-2;
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'g_vect' assigned to ");
        outfile.Write(g_vect);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'epsilon' assigned to ");
        outfile.Write(epsilon);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        InputFormat.get_input(filename, out v_launch, out theta, out p_target);
        InputConstraints.input_constraints(v_launch, theta, p_target);
        double t_flight = Calculations.func_t_flight(v_launch, theta, g_vect);
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 't_flight' assigned to ");
        outfile.Write(t_flight);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        double p_land = Calculations.func_p_land(v_launch, theta, g_vect);
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'p_land' assigned to ");
        outfile.Write(p_land);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        double d_offset = Calculations.func_d_offset(p_target, p_land);
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 'd_offset' assigned to ");
        outfile.Write(d_offset);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        string s = Calculations.func_s(p_target, epsilon, d_offset);
        outfile = new StreamWriter("log.txt", true);
        outfile.Write("var 's' assigned to ");
        outfile.Write(s);
        outfile.WriteLine(" in module Control");
        outfile.Close();
        OutputFormat.write_output(s, d_offset);
    }
}
