using System;
using System.IO;

public class InputConstraints {
    
    public static void input_constraints(double v_launch, double theta, double p_target) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function input_constraints called with inputs: {");
        outfile.Write("  v_launch = ");
        outfile.Write(v_launch);
        outfile.WriteLine(", ");
        outfile.Write("  theta = ");
        outfile.Write(theta);
        outfile.WriteLine(", ");
        outfile.Write("  p_target = ");
        outfile.WriteLine(p_target);
        outfile.WriteLine("  }");
        outfile.Close();
        
        if (!(v_launch > 0)) {
            Console.Write("Warning: ");
            Console.Write("v_launch has value ");
            Console.Write(v_launch);
            Console.Write(" but suggested to be ");
            Console.Write("above ");
            Console.Write(0);
            Console.WriteLine(".");
        }
        if (!(0 < theta && theta < Math.PI / 2)) {
            Console.Write("Warning: ");
            Console.Write("theta has value ");
            Console.Write(theta);
            Console.Write(" but suggested to be ");
            Console.Write("between ");
            Console.Write(0);
            Console.Write(" and ");
            Console.Write(Math.PI / 2);
            Console.Write(" ((pi)/(2))");
            Console.WriteLine(".");
        }
        if (!(p_target > 0)) {
            Console.Write("Warning: ");
            Console.Write("p_target has value ");
            Console.Write(p_target);
            Console.Write(" but suggested to be ");
            Console.Write("above ");
            Console.Write(0);
            Console.WriteLine(".");
        }
    }
}
