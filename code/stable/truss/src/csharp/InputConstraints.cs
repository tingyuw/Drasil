/** \file InputConstraints.cs
    \author Ting-Yu Wu
    \brief Provides the function for checking the physical constraints and software constraints on the input
*/
using System;
using System.IO;

public class InputConstraints {
    
    /** \brief Verifies that input values satisfy the physical constraints and software constraints
        \param inParams structure holding the input values
        \param pi ratio of circumference to diameter for any circle
    */
    public static void input_constraints(InputParameters inParams, double pi) {
        StreamWriter outfile;
        outfile = new StreamWriter("log.txt", true);
        outfile.WriteLine("function input_constraints called with inputs: {");
        outfile.Write("  inParams = ");
        outfile.Write("Instance of InputParameters object");
        outfile.WriteLine(", ");
        outfile.Write("  pi = ");
        outfile.WriteLine(pi);
        outfile.WriteLine("  }");
        outfile.Close();
        
        if (!(-100000 <= inParams.F_vect_1 && inParams.F_vect_1 <= 100000)) {
            Console.Write("F_vect_1 has value ");
            Console.Write(inParams.F_vect_1);
            Console.Write(", but is expected to be ");
            Console.Write("between ");
            Console.Write(-100000);
            Console.Write(" (F_vect_min)");
            Console.Write(" and ");
            Console.Write(100000);
            Console.Write(" (F_vect_max)");
            Console.WriteLine(".");
            throw new Exception("InputError");
        }
        if (!(0.0 < inParams.x_1 && inParams.x_1 <= 100000)) {
            Console.Write("x_1 has value ");
            Console.Write(inParams.x_1);
            Console.Write(", but is expected to be ");
            Console.Write("between ");
            Console.Write(0.0);
            Console.Write(" (d_min)");
            Console.Write(" and ");
            Console.Write(100000);
            Console.Write(" (d_max)");
            Console.WriteLine(".");
            throw new Exception("InputError");
        }
        if (!(0.0 < inParams.x_2 && inParams.x_2 <= 100000)) {
            Console.Write("x_2 has value ");
            Console.Write(inParams.x_2);
            Console.Write(", but is expected to be ");
            Console.Write("between ");
            Console.Write(0.0);
            Console.Write(" (d_min)");
            Console.Write(" and ");
            Console.Write(100000);
            Console.Write(" (d_max)");
            Console.WriteLine(".");
            throw new Exception("InputError");
        }
        if (!(pi / 2 < inParams.θ_1 && inParams.θ_1 < pi / 2)) {
            Console.Write("θ_1 has value ");
            Console.Write(inParams.θ_1);
            Console.Write(", but is expected to be ");
            Console.Write("between ");
            Console.Write(pi / 2);
            Console.Write(" (θ_min)");
            Console.Write(" and ");
            Console.Write(pi / 2);
            Console.Write(" (θ_max)");
            Console.WriteLine(".");
            throw new Exception("InputError");
        }
        if (!(pi / 2 < inParams.θ_2 && inParams.θ_2 < pi / 2)) {
            Console.Write("θ_2 has value ");
            Console.Write(inParams.θ_2);
            Console.Write(", but is expected to be ");
            Console.Write("between ");
            Console.Write(pi / 2);
            Console.Write(" (θ_min)");
            Console.Write(" and ");
            Console.Write(pi / 2);
            Console.Write(" (θ_max)");
            Console.WriteLine(".");
            throw new Exception("InputError");
        }
        
        if (!(inParams.F_vect_1 > 0)) {
            Console.Write("F_vect_1 has value ");
            Console.Write(inParams.F_vect_1);
            Console.Write(", but is expected to be ");
            Console.Write("above ");
            Console.Write(0);
            Console.WriteLine(".");
            throw new Exception("InputError");
        }
        if (!(inParams.x_1 > 0)) {
            Console.Write("x_1 has value ");
            Console.Write(inParams.x_1);
            Console.Write(", but is expected to be ");
            Console.Write("above ");
            Console.Write(0);
            Console.WriteLine(".");
            throw new Exception("InputError");
        }
        if (!(inParams.x_2 > 0)) {
            Console.Write("x_2 has value ");
            Console.Write(inParams.x_2);
            Console.Write(", but is expected to be ");
            Console.Write("above ");
            Console.Write(0);
            Console.WriteLine(".");
            throw new Exception("InputError");
        }
        if (!(0 < inParams.θ_1 && inParams.θ_1 < pi)) {
            Console.Write("θ_1 has value ");
            Console.Write(inParams.θ_1);
            Console.Write(", but is expected to be ");
            Console.Write("between ");
            Console.Write(0);
            Console.Write(" and ");
            Console.Write(pi);
            Console.Write(" (pi)");
            Console.WriteLine(".");
            throw new Exception("InputError");
        }
        if (!(0 < inParams.θ_2 && inParams.θ_2 < pi)) {
            Console.Write("θ_2 has value ");
            Console.Write(inParams.θ_2);
            Console.Write(", but is expected to be ");
            Console.Write("between ");
            Console.Write(0);
            Console.Write(" and ");
            Console.Write(pi);
            Console.Write(" (pi)");
            Console.WriteLine(".");
            throw new Exception("InputError");
        }
    }
}
