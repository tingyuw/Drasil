using System;
using System.IO;

public class Calculations {
    
    public static double func_t_flight(double v_launch, double theta, double g_vect) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function func_t_flight called with inputs: {");
        outfile.Write("  v_launch = ");
        outfile.Write(v_launch);
        outfile.WriteLine(", ");
        outfile.Write("  theta = ");
        outfile.Write(theta);
        outfile.WriteLine(", ");
        outfile.Write("  g_vect = ");
        outfile.WriteLine(g_vect);
        outfile.WriteLine("  }");
        outfile.Close();
        
        return 2 * v_launch * Math.Sin(theta) / g_vect;
    }
    
    public static double func_p_land(double v_launch, double theta, double g_vect) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function func_p_land called with inputs: {");
        outfile.Write("  v_launch = ");
        outfile.Write(v_launch);
        outfile.WriteLine(", ");
        outfile.Write("  theta = ");
        outfile.Write(theta);
        outfile.WriteLine(", ");
        outfile.Write("  g_vect = ");
        outfile.WriteLine(g_vect);
        outfile.WriteLine("  }");
        outfile.Close();
        
        return 2 * Math.Pow(v_launch, 2) * Math.Sin(theta) * Math.Cos(theta) / g_vect;
    }
    
    public static double func_d_offset(double p_target, double p_land) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function func_d_offset called with inputs: {");
        outfile.Write("  p_target = ");
        outfile.Write(p_target);
        outfile.WriteLine(", ");
        outfile.Write("  p_land = ");
        outfile.WriteLine(p_land);
        outfile.WriteLine("  }");
        outfile.Close();
        
        return p_land - p_target;
    }
    
    public static string func_s(double p_target, double epsilon, double d_offset) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function func_s called with inputs: {");
        outfile.Write("  p_target = ");
        outfile.Write(p_target);
        outfile.WriteLine(", ");
        outfile.Write("  epsilon = ");
        outfile.Write(epsilon);
        outfile.WriteLine(", ");
        outfile.Write("  d_offset = ");
        outfile.WriteLine(d_offset);
        outfile.WriteLine("  }");
        outfile.Close();
        
        if (Math.Abs(d_offset / p_target) < epsilon) {
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
