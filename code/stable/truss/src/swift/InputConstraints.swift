/** InputConstraints.swift
    Provides the function for checking the physical constraints and software constraints on the input
    - Authors: Ting-Yu Wu
*/
import Foundation

/** Verifies that input values satisfy the physical constraints and software constraints
    - Parameter inParams: structure holding the input values
    - Parameter pi: ratio of circumference to diameter for any circle
*/
func input_constraints(_ inParams: inout InputParameters, _ pi: Double) throws -> Void {
    var outfile: FileHandle
    do {
        outfile = try FileHandle(forWritingTo: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("log.txt"))
        try outfile.seekToEnd()
    } catch {
        throw "Error opening file."
    }
    do {
        try outfile.write(contentsOf: Data("function input_constraints called with inputs: {".utf8))
        try outfile.write(contentsOf: Data("\n".utf8))
    } catch {
        throw "Error printing to file."
    }
    do {
        try outfile.write(contentsOf: Data("  inParams = ".utf8))
    } catch {
        throw "Error printing to file."
    }
    do {
        try outfile.write(contentsOf: Data("Instance of InputParameters object".utf8))
    } catch {
        throw "Error printing to file."
    }
    do {
        try outfile.write(contentsOf: Data(", ".utf8))
        try outfile.write(contentsOf: Data("\n".utf8))
    } catch {
        throw "Error printing to file."
    }
    do {
        try outfile.write(contentsOf: Data("  pi = ".utf8))
    } catch {
        throw "Error printing to file."
    }
    do {
        try outfile.write(contentsOf: Data(String(pi).utf8))
        try outfile.write(contentsOf: Data("\n".utf8))
    } catch {
        throw "Error printing to file."
    }
    do {
        try outfile.write(contentsOf: Data("  }".utf8))
        try outfile.write(contentsOf: Data("\n".utf8))
    } catch {
        throw "Error printing to file."
    }
    do {
        try outfile.close()
    } catch {
        throw "Error closing file."
    }
    
    if !(Double(-100000) <= inParams.F_vect_1 && inParams.F_vect_1 <= Double(100000)) {
        print("F_vect_1 has value ", terminator: "")
        print(inParams.F_vect_1, terminator: "")
        print(", but is expected to be ", terminator: "")
        print("between ", terminator: "")
        print(-100000, terminator: "")
        print(" (F_vect_min)", terminator: "")
        print(" and ", terminator: "")
        print(100000, terminator: "")
        print(" (F_vect_max)", terminator: "")
        print(".")
        throw "InputError"
    }
    if !(0.0 < inParams.x_1 && inParams.x_1 <= Double(100000)) {
        print("x_1 has value ", terminator: "")
        print(inParams.x_1, terminator: "")
        print(", but is expected to be ", terminator: "")
        print("between ", terminator: "")
        print(0.0, terminator: "")
        print(" (d_min)", terminator: "")
        print(" and ", terminator: "")
        print(100000, terminator: "")
        print(" (d_max)", terminator: "")
        print(".")
        throw "InputError"
    }
    if !(0.0 < inParams.x_2 && inParams.x_2 <= Double(100000)) {
        print("x_2 has value ", terminator: "")
        print(inParams.x_2, terminator: "")
        print(", but is expected to be ", terminator: "")
        print("between ", terminator: "")
        print(0.0, terminator: "")
        print(" (d_min)", terminator: "")
        print(" and ", terminator: "")
        print(100000, terminator: "")
        print(" (d_max)", terminator: "")
        print(".")
        throw "InputError"
    }
    if !(pi / Double(2) < inParams.θ_1 && inParams.θ_1 < pi / Double(2)) {
        print("θ_1 has value ", terminator: "")
        print(inParams.θ_1, terminator: "")
        print(", but is expected to be ", terminator: "")
        print("between ", terminator: "")
        print(pi / Double(2), terminator: "")
        print(" (θ_min)", terminator: "")
        print(" and ", terminator: "")
        print(pi / Double(2), terminator: "")
        print(" (θ_max)", terminator: "")
        print(".")
        throw "InputError"
    }
    if !(pi / Double(2) < inParams.θ_2 && inParams.θ_2 < pi / Double(2)) {
        print("θ_2 has value ", terminator: "")
        print(inParams.θ_2, terminator: "")
        print(", but is expected to be ", terminator: "")
        print("between ", terminator: "")
        print(pi / Double(2), terminator: "")
        print(" (θ_min)", terminator: "")
        print(" and ", terminator: "")
        print(pi / Double(2), terminator: "")
        print(" (θ_max)", terminator: "")
        print(".")
        throw "InputError"
    }
    
    if !(inParams.F_vect_1 > Double(0)) {
        print("F_vect_1 has value ", terminator: "")
        print(inParams.F_vect_1, terminator: "")
        print(", but is expected to be ", terminator: "")
        print("above ", terminator: "")
        print(0, terminator: "")
        print(".")
        throw "InputError"
    }
    if !(inParams.x_1 > Double(0)) {
        print("x_1 has value ", terminator: "")
        print(inParams.x_1, terminator: "")
        print(", but is expected to be ", terminator: "")
        print("above ", terminator: "")
        print(0, terminator: "")
        print(".")
        throw "InputError"
    }
    if !(inParams.x_2 > Double(0)) {
        print("x_2 has value ", terminator: "")
        print(inParams.x_2, terminator: "")
        print(", but is expected to be ", terminator: "")
        print("above ", terminator: "")
        print(0, terminator: "")
        print(".")
        throw "InputError"
    }
    if !(Double(0) < inParams.θ_1 && inParams.θ_1 < pi) {
        print("θ_1 has value ", terminator: "")
        print(inParams.θ_1, terminator: "")
        print(", but is expected to be ", terminator: "")
        print("between ", terminator: "")
        print(0, terminator: "")
        print(" and ", terminator: "")
        print(pi, terminator: "")
        print(" (pi)", terminator: "")
        print(".")
        throw "InputError"
    }
    if !(Double(0) < inParams.θ_2 && inParams.θ_2 < pi) {
        print("θ_2 has value ", terminator: "")
        print(inParams.θ_2, terminator: "")
        print(", but is expected to be ", terminator: "")
        print("between ", terminator: "")
        print(0, terminator: "")
        print(" and ", terminator: "")
        print(pi, terminator: "")
        print(" (pi)", terminator: "")
        print(".")
        throw "InputError"
    }
}
