package Truss;

/** \file InputConstraints.java
    \author Ting-Yu Wu
    \brief Provides the function for checking the physical constraints and software constraints on the input
*/
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class InputConstraints {
    
    /** \brief Verifies that input values satisfy the physical constraints and software constraints
        \param inParams structure holding the input values
        \param pi ratio of circumference to diameter for any circle
    */
    public static void input_constraints(InputParameters inParams, double pi) throws Exception, IOException {
        PrintWriter outfile;
        outfile = new PrintWriter(new FileWriter(new File("log.txt"), true));
        outfile.println("function input_constraints called with inputs: {");
        outfile.print("  inParams = ");
        outfile.print("Instance of InputParameters object");
        outfile.println(", ");
        outfile.print("  pi = ");
        outfile.println(pi);
        outfile.println("  }");
        outfile.close();
        
        if (!(-100000 <= inParams.F_vect_1 && inParams.F_vect_1 <= 100000)) {
            System.out.print("F_vect_1 has value ");
            System.out.print(inParams.F_vect_1);
            System.out.print(", but is expected to be ");
            System.out.print("between ");
            System.out.print(-100000);
            System.out.print(" (F_vect_min)");
            System.out.print(" and ");
            System.out.print(100000);
            System.out.print(" (F_vect_max)");
            System.out.println(".");
            throw new Exception("InputError");
        }
        if (!(0.0 < inParams.x_1 && inParams.x_1 <= 100000)) {
            System.out.print("x_1 has value ");
            System.out.print(inParams.x_1);
            System.out.print(", but is expected to be ");
            System.out.print("between ");
            System.out.print(0.0);
            System.out.print(" (d_min)");
            System.out.print(" and ");
            System.out.print(100000);
            System.out.print(" (d_max)");
            System.out.println(".");
            throw new Exception("InputError");
        }
        if (!(0.0 < inParams.x_2 && inParams.x_2 <= 100000)) {
            System.out.print("x_2 has value ");
            System.out.print(inParams.x_2);
            System.out.print(", but is expected to be ");
            System.out.print("between ");
            System.out.print(0.0);
            System.out.print(" (d_min)");
            System.out.print(" and ");
            System.out.print(100000);
            System.out.print(" (d_max)");
            System.out.println(".");
            throw new Exception("InputError");
        }
        if (!(pi / 2 < inParams.θ_1 && inParams.θ_1 < pi / 2)) {
            System.out.print("θ_1 has value ");
            System.out.print(inParams.θ_1);
            System.out.print(", but is expected to be ");
            System.out.print("between ");
            System.out.print(pi / 2);
            System.out.print(" (θ_min)");
            System.out.print(" and ");
            System.out.print(pi / 2);
            System.out.print(" (θ_max)");
            System.out.println(".");
            throw new Exception("InputError");
        }
        if (!(pi / 2 < inParams.θ_2 && inParams.θ_2 < pi / 2)) {
            System.out.print("θ_2 has value ");
            System.out.print(inParams.θ_2);
            System.out.print(", but is expected to be ");
            System.out.print("between ");
            System.out.print(pi / 2);
            System.out.print(" (θ_min)");
            System.out.print(" and ");
            System.out.print(pi / 2);
            System.out.print(" (θ_max)");
            System.out.println(".");
            throw new Exception("InputError");
        }
        
        if (!(inParams.F_vect_1 > 0)) {
            System.out.print("F_vect_1 has value ");
            System.out.print(inParams.F_vect_1);
            System.out.print(", but is expected to be ");
            System.out.print("above ");
            System.out.print(0);
            System.out.println(".");
            throw new Exception("InputError");
        }
        if (!(inParams.x_1 > 0)) {
            System.out.print("x_1 has value ");
            System.out.print(inParams.x_1);
            System.out.print(", but is expected to be ");
            System.out.print("above ");
            System.out.print(0);
            System.out.println(".");
            throw new Exception("InputError");
        }
        if (!(inParams.x_2 > 0)) {
            System.out.print("x_2 has value ");
            System.out.print(inParams.x_2);
            System.out.print(", but is expected to be ");
            System.out.print("above ");
            System.out.print(0);
            System.out.println(".");
            throw new Exception("InputError");
        }
        if (!(0 < inParams.θ_1 && inParams.θ_1 < pi)) {
            System.out.print("θ_1 has value ");
            System.out.print(inParams.θ_1);
            System.out.print(", but is expected to be ");
            System.out.print("between ");
            System.out.print(0);
            System.out.print(" and ");
            System.out.print(pi);
            System.out.print(" (pi)");
            System.out.println(".");
            throw new Exception("InputError");
        }
        if (!(0 < inParams.θ_2 && inParams.θ_2 < pi)) {
            System.out.print("θ_2 has value ");
            System.out.print(inParams.θ_2);
            System.out.print(", but is expected to be ");
            System.out.print("between ");
            System.out.print(0);
            System.out.print(" and ");
            System.out.print(pi);
            System.out.print(" (pi)");
            System.out.println(".");
            throw new Exception("InputError");
        }
    }
}
