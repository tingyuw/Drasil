import math

def func_t_flight(v_launch, theta, g_vect):
    outfile = open("log.txt", "a")
    print("function func_t_flight called with inputs: {", file=outfile)
    print("  v_launch = ", end='', file=outfile)
    print(v_launch, end='', file=outfile)
    print(", ", file=outfile)
    print("  theta = ", end='', file=outfile)
    print(theta, end='', file=outfile)
    print(", ", file=outfile)
    print("  g_vect = ", end='', file=outfile)
    print(g_vect, file=outfile)
    print("  }", file=outfile)
    outfile.close()
    
    return 2 * v_launch * math.sin(theta) / g_vect

def func_p_land(v_launch, theta, g_vect):
    outfile = open("log.txt", "a")
    print("function func_p_land called with inputs: {", file=outfile)
    print("  v_launch = ", end='', file=outfile)
    print(v_launch, end='', file=outfile)
    print(", ", file=outfile)
    print("  theta = ", end='', file=outfile)
    print(theta, end='', file=outfile)
    print(", ", file=outfile)
    print("  g_vect = ", end='', file=outfile)
    print(g_vect, file=outfile)
    print("  }", file=outfile)
    outfile.close()
    
    return 2 * v_launch ** 2 * math.sin(theta) * math.cos(theta) / g_vect

def func_d_offset(p_target, p_land):
    outfile = open("log.txt", "a")
    print("function func_d_offset called with inputs: {", file=outfile)
    print("  p_target = ", end='', file=outfile)
    print(p_target, end='', file=outfile)
    print(", ", file=outfile)
    print("  p_land = ", end='', file=outfile)
    print(p_land, file=outfile)
    print("  }", file=outfile)
    outfile.close()
    
    return p_land - p_target

def func_s(p_target, epsilon, d_offset):
    outfile = open("log.txt", "a")
    print("function func_s called with inputs: {", file=outfile)
    print("  p_target = ", end='', file=outfile)
    print(p_target, end='', file=outfile)
    print(", ", file=outfile)
    print("  epsilon = ", end='', file=outfile)
    print(epsilon, end='', file=outfile)
    print(", ", file=outfile)
    print("  d_offset = ", end='', file=outfile)
    print(d_offset, file=outfile)
    print("  }", file=outfile)
    outfile.close()
    
    if (math.fabs(d_offset / p_target) < epsilon) :
        return "The target was hit."
    elif (d_offset < 0) :
        return "The projectile fell short."
    else :
        return "The projectile went long."
